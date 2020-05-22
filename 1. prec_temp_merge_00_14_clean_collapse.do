************************Collapse cummulative prec*******************************

clear all

set more off

use "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean.dta" 

split date, parse()

split date1, parse(/)

drop date1 date2 date3 date12 date _merge notnumeric

rename date11 month

rename date13 year

label variable year "year of observation"

label variable month "month of observation"

order station year month prec Tmid Tmax Tmin Tobs

drop if month=="NA"

destring year month, replace

sort station year month 

collapse(sum) prec, by (station year month)

collapse(mean) prec, by (station year)

save "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean_collapse_prec_month_year_ave.dta", replace

********************Collapse average temperaturee*******************************

clear all

set more off

use "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean.dta" 

split date, parse()

split date1, parse(/)

drop date1 date2 date3 date12 date _merge notnumeric

rename date11 month

rename date13 year

order station year month prec Tmid Tmax Tmin Tobs

drop if month=="NA"

destring year month, replace

sort station year month 

label variable year "year of observation"

label variable month "month of observation"

collapse(mean) T*, by (station year)

save "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean_collapse_T_year_ave.dta", replace

******************Merge 1:m T* to pre*******************************************

clear all

use "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean_collapse_T_year_ave.dta"

merge 1:m station year using "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean_collapse_prec_month_year_ave.dta"

drop _m

save "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_2clean_collapse_T_prec_year_ave_merge.dta", replace
