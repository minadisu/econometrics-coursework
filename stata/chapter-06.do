* Chapter 6
*C3
use "data/WAGE2.DTA",clear
describe
regress lwage educ exper c.educ#c.exper
regress lwage c.educ##c.exper
generate educ_exper=educ*exper
regress lwage educ exper educ_exper
generate x=educ*exper-10*educ
regress lwage educ exper x
regress lwage c.educ##c.exper
margins,dydx(educ) at(exper==10)
display exp(.0760795)-1
*C6
use "data/VOTE1.DTA",clear
describe
generate expendA_expendB=expendA*expendB
regress voteA prtystrA expendA expendB expendA_expendB
summarize expendA
display e(b)[1,3]+e(b)[1,4]*300
regress voteA prtystrA c.expendA##c.expendB
margins,dydx(expendB) at(expendA=(300))
regress voteA prtystrA expendA expendB expendA_expendB
display e(b)[1,2]+e(b)[1,4]*100
regress voteA prtystrA expendA expendB shareA
display .0042669-.4943944/3
*C12
use "data/401ksubs.dta",clear
describe
keep if fsize==1
count if age==25
regress nettfa inc age agesq
display -_b[age]/(2*_b[agesq])
generate x=agesq-50*age
regress nettfa inc age x
regress nettfa inc x
regress nettfa inc c.age##c.age
margins, at(inc=30 age=(25(1)64))
marginsplot
regress nettfa c.inc##c.inc c.age##c.age