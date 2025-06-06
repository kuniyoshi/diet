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

    if ( $line =~ m{\A \s* [#] \s* (?:year)? \s* (\d{4}) \z}msx ) {
        say to_be_tsv( $year, @chunks )
            if $year && @chunks;
        $year = $1;
        @chunks = ( );
    }

    next
        if $line =~ m{\A \s* [#] }msx;

    my $fixed = fix( $line );

    if ( $fixed =~ m{\w} ) {
        push @chunks, $fixed;

        next;
    }

    next
        unless @chunks;

    die "Could not complete chunks: ", Data::Dumper->new( [ \@chunks ] )->Terse( 1 )->Dump( )
        unless @chunks == @HEADINGS;

    say to_be_tsv( $year, @chunks );

    @chunks = ( );
}

if ( @chunks ) {
    die "Could not complete chunks: ", Data::Dumper->new( [ @chunks ] )->Terse( 1 )->Dump( )
        unless @chunks == @HEADINGS;

    say to_be_tsv( $year, @chunks );

    @chunks = ( );
}

exit;

sub fix {
    my $line = shift;

    if ( $line =~ m{\A \d+ , \d+ \z}msx ) {
        $line =~ s{,}{.};
    }

    return $line;
}

sub to_be_tsv {
    my( $year, @chunks ) = @_;
    my $date = to_be_date( $year, shift @chunks );

    return join "\t", ( $date, @chunks );
}

sub to_be_date {
    my( $year, $month_day ) = @_;
    my( $month, $day ) = map { sprintf "%02d", $_ }
                         split m{/}, $month_day;

    return join q{-}, ( $year, $month, $day );
}
