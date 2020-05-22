************************Flag values repeates yearly*****************************
clear all 

set more off

use "/Users/rodrigoquintana/Dropbox/ECON 1150 - DA/SIHHarvard/prec_temp_merge_00_14_v2_clean_merge_collapse_T_prec_month_year_ave_merge.dta", clear

foreach var in prec Tmid Tmax Tmin Tobs {
	bysort station: ge tag_`var'=(`var'[_n]==`var'[_n-1])
	replace tag_`var'=1 if `var'==0 | `var'==.
}

set dp period, permanently
 
order station longitude latitude year prec Tmid Tmax Tmin Tobs tag_prec tag_Tmid tag_Tmax tag_Tmin tag_Tobs

drop if longitude ==0 | latitude==0

save "prec_temp_merge_00_14_v2_clean_merge_collapse_T_prec_year_ave_merge_flag.dta", replace

export delimited using "prec_temp_merge_00_14_v2_clean_merge_collapse_T_prec_year_ave_merge_flag.csv", replace
