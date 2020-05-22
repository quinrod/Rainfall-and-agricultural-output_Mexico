clear all

set more off

cd "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/"

****precipitation***
insheet using precipitacion2.csv, clear

rename precipitacion prec
rename fecha date
rename longitud longitude
rename latitud latitude

label variable prec "prec in m^2"
label variable date "date in mm/dd/yyyy and 00:00:00 format"
label variable longitude "longitude of station"
label variable latitude "latitude of station"

gen byte notnumeric = real(prec)==.
list prec if notnumeric
replace prec="." if prec=="NA"
destring prec, replace
drop notnumeric

sort longitude latitude date
duplicates drop longitude latitude date, force
split date, parse()
split date1, parse(/)
drop date1 date2 date3 date
rename date11 month 
rename date12 day
rename date13 year

destring month day year, replace
gen edate=mdy(month,day,year)
format edate %dM_d,_CY
sort longitude latitude edate
order longitude latitude month day year edate prec

save "precipitation_00_14_v2.dta", replace

***temperatures***
insheet using temperaturas2.csv, clear

rename tmedia Tmid
rename tmax Tmax
rename tmin Tmin
rename tobs Tobs
rename fecha date
rename longitud longitude
rename latitud latitude

label variable Tmid "average of temperature"
label variable Tmax "maximum of temperature"
label variable Tmin "minumum of temperature"
label variable Tobs "observation of temperature"
label variable date "date in mm/dd/yyyy and 00:00:00 format"
label variable longitude "longitude of station"
label variable latitude "latitude of station"

foreach var in Tmid Tmax Tmin Tobs {
	destring `var', replace
}

gen byte notnumeric= real(Tmax)==.
list Tmax if notnumeric
replace Tmax="." if Tmax=="NA"
destring Tmax, replace
drop notnumeric

gen byte notnumeric1= real(Tmin)==.
list Tmin if notnumeric1
replace Tmin="." if Tmin=="NA"
destring Tmin, replace
drop notnumeric1

gen byte notnumeric2= real(Tobs)==.
list Tobs if notnumeric2

#delimit;
replace Tobs="." if Tobs=="NA" | Tobs=="**" | Tobs=="" | Tobs=="nr" | Tobs=="N/D" 
| Tobs=="S/D"| Tobs=="S/R" | Tobs=="s.d." | Tobs=="S.D." | Tobs=="EXC" | Tobs=="+" 
| Tobs=="--" | Tobs=="-" | Tobs=="|" | Tobs=="ç" | Tobs=="*" | Tobs=="q" | Tobs=="-¿"
| Tobs=="NR" | Tobs=="º" | Tobs=="*/" | Tobs=="_" | Tobs=="-" | Tobs==" -" 
; #delimit cr

destring Tobs, replace force
drop notnumeric2

sort longitude latitude date
duplicates drop longitude latitude date, force
split date, parse()
split date1, parse(/)
drop date1 date2 date3 date
rename date11 month 
rename date12 day
rename date13 year

destring month day year, replace
gen edate=mdy(month,day,year)
format edate %dM_d,_CY
sort longitude latitude edate
order longitude latitude month day year edate Tmid Tmax Tmin Tobs

save "temperature_00_14_v2.dta", replace

***merge precipitation with temperature by coordinates and date***
merge m:1 longitude latitude edate using precipitation_00_14_v2.dta
drop _m
sort longitude latitude edate
set dp period, permanently

save "prec_temp_merge_00_14_v2_clean.dta", replace

***Merge with stations by coordinates***
use "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/stations.dta", clear
duplicates drop longitude latitude, force

merge 1:m longitude latitude using prec_temp_merge_00_14_v2_clean.dta
drop if _m!=3
drop _m
sort longitude latitude edate

save "prec_temp_merge_00_14_v2_clean_merge.dta", replace


