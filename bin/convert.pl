#!/usr/bin/env perl
use 5.10.0;
use utf8;
use strict;
use warnings;
use open qw( :utf8 :std );
use Data::Dumper;
use Readonly;

Readonly my @HEADINGS => (
    "date",
    "weight",
    "body_fat_percentage",
    "visceral_fat",
    "skeletal_muscle_rate",
    "body_age",
    "basal_metabolic_rate",
    "BMI",
);

my $year;
my @chunks;

say join "\t", @HEADINGS;

while ( <> ) {
    chomp( my $line = $_ );

    if ( $line =~ m{\A \s* [#] \s* year \s* (\d+) }msx ) {
        $year = $1;
    }

    next
        if $line =~ m{\A \s* [#] }msx;

    if ( $line =~ m{\w} ) {
        push @chunks, $line;

        next;
    }

    next
        unless @chunks;

    die "Could not complete chunks: ", Data::Dumper->new( [ \@chunks ] )->Terse( 1 )->Dump( )
        unless @chunks == @HEADINGS;

    my $date = to_be_date( $year, shift @chunks );

    say join "\t", ( $date, @chunks );

    @chunks = ( );
}

if ( @chunks ) {
    die "Could not complete chunks: ", Data::Dumper->new( [ @chunks ] )->Terse( 1 )->Dump( )
        unless @chunks == @HEADINGS;

    say join "\t", @chunks;
    @chunks = ( );
}

exit;

sub to_be_date {
    my( $year, $month_day ) = @_;
    my( $month, $day ) = map { sprintf "%02d", $_ }
                         split m{/}, $month_day;

    return join q{-}, ( $year, $month, $day );
}
