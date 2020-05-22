cd "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/"

***********************Collapse cummulative prec*******************************

clear all

set more off

use "prec_temp_merge_00_14_v2_clean_merge.dta", clear 

label variable day "day of observation"

label variable year "year of observation"

label variable month "month of observation"

label variable edate "date, month, year of observation"

collapse(sum) prec, by (station longitude latitude year month)

save "prec_temp_merge_00_14_v2_clean_merge_collapse_prec_month_year_cumm.dta", replace

********************Collapse average temperature*******************************

clear all

set more off

use "prec_temp_merge_00_14_v2_clean_merge.dta" 

label variable day "day of observation"

label variable year "year of observation"

label variable month "month of observation"

label variable edate "date, month, year of observation"

collapse(mean) T*, by (station longitude latitude year month)

save "prec_temp_merge_00_14_v2_clean_merge_collapse_T_month_year_ave.dta", replace

******************Merge 1:m T* to pre*******************************************

clear all

use "prec_temp_merge_00_14_v2_clean_merge_collapse_T_month_year_ave.dta"

merge 1:m station longitude latitude month year using "prec_temp_merge_00_14_v2_clean_merge_collapse_prec_month_year_cumm.dta"

drop _m

format Tmid Tmax Tmin Tobs prec %9.2gc

save "prec_temp_merge_00_14_v2_clean_merge_collapse_T_prec_month_year_ave_merge.dta", replace
