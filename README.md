# Rainfall-and-agricultural-output_Mexico
Weather extrapolation and OLS

### Findings
- Difference-in-difference estimates find that workers who enroll in the courses demanded by their employers increase their job tenure by 8.89 months compared to non-enrolled nominees. 
- However, those who complete the training stay in the job 3.36 months less, on average, than those who do not. 
- At firm level, results show that having a course approved is associated with higher turnover in the short run when considering subgroups of workers who participate in Pronatec-MDIC. The effect dissipates in the third year.

### Suggestions
- The fact that only one Ministry employs this demand - driven design out of 21 eligible Ministries provides  an  opportunity  to  switch  to  a  demand - driven  training  model  to improve  labor productivity in the long run 16 , a phenomenon that may be holding back the labor productivity potential of firms in the country. 
- Ultimately , this supply - driven programs spent BRL 2.4 billion annually in  2015 17 while  demand - driven  programs  can  be  more cost-effective,  specially  in times of fiscal consolidation. 

### Methodology 
Weather extrapolation
- Firms: Match  the  probability  of  course  approval  of  firms that demand and obtain training confirmation with firms of similar characteristics that demand but do not obtain confirmation. The matching is built on a logit model that captures the likelihood of course approval based on its pre-treatment features.
- Workers: Match the probability of program enrollment of workers enrolled in cours es in 2015 - 16  demanded  by  the  same  firm  that  employs  them  with  that  of  workers  with  similar characteristics  who  do  not  enroll  but  are  employed in  the  same  firm.

Ordinary Least Squares (OLS)
- Firms: To estimate the difference in labor turnover of firms which experience the treatment and those not exposed to it, deduct turnover during the period after course approval from the turnover before.
- Workers: To assess the difference in outcomes for workers who enroll or graduate and those who do not, deduct job tenure during the period after course approval from the job tenure before.

### Data
Clean and merge large datasets from technical education and labor registry:

00. prog_cpf_pis_cnpj-v2.do -> Defining function to validate codes 		
01. Functions.do -> Auxiliar function to simplify the code
02. Bases de ajuste-CNPJ_Municipio_curso.do -> Data to correct lack of variable

### Visualization

![Extrapolation](https://github.com/quinrod/Rainfall-and-agricultural-output_Mexico/blob/master/maps/Weather%20interpolated%20for%20June%202010%20in%20Mexico.pdf)