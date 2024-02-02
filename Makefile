raw_data = data/raw.txt data/raw.to.2020-07.txt data/raw.2020-07.to.2020.10.txt data/raw.2020-10.to.2020-12.txt data/raw.2020-12.to.2021.03.txt data/raw.2021-03.to.2021.05.txt data/raw.2021-05.to.2021.08.txt data/raw.2021-08.to.2021.11.txt data/raw.2021.to.2022.txt data/raw.2022-01.to.2022-04.txt data/raw.2022-05.to.2022.08.txt data/raw.2022-09.to.2022-10.txt data/raw.2022-11.to.2022-12.txt data/raw.2023-01.to.2023-03.txt data/raw.2023-04.to.2023-06.txt data/raw.2023-07.to.2023.10.txt data/raw.2023-11.to.2023-12.txt
data = data/diet.tsv

tsv:
	bin/convert.pl $(raw_data) | tee $(data)

plot:
	R CMD BATCH bin/plot.R
