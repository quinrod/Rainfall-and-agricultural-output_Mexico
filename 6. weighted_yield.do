clear all

use "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/Data Analysis/Data Cleaned/data_yields_mapa.dta", clear

rename anio year

rename id CVEGEO

bysort year CVEGEO: egen sum_yield=sum(yield) 

g weight=yield/sum_yield

g weighted_yield=weight*yield

bysort year CVEGEO: egen sum_weighted_yield=sum(weighted_yield)

egen key=tag(sum_weighted_yield)

sort key

keep if key==1

sort year

export delimited using "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/Data Analysis/Data Cleaned/weighted_yield.csv", replace

