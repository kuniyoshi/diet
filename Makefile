raw_data = data/raw.txt
data = data/diet.tsv

tsv:
	bin/convert.pl $(raw_data) | tee $(data)

plot:
	R CMD BATCH bin/plot.R
