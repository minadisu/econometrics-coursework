* Chapter 2: Simple regression
* Run from repository root; add datasets to data/
*C1
use "data/401K.DTA",clear
describe
sum prate mrate
reg prate mrate
display 83.07546+5.861079*3.5
count if mrate>=3.5
*C4
use "data/WAGE2.DTA",clear
describe
summarize wage IQ
regress wage IQ
display 15*8.303064
regress lwage IQ
display 15*.0088072
*C9
use "data/countymurders.dta",clear
describe
keep if year==1996
count if murders==0
count if execs
sum execs
reg murders execs
predict murders_hat,xb
sum murders_hat