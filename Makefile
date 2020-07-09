raw_data = data/raw.txt data/raw.to.2020-07.txt
data = data/diet.tsv

tsv:
	bin/convert.pl $(raw_data) | tee $(data)

plot:
	R CMD BATCH bin/plot.R
