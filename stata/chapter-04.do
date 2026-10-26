* Chapter 4: Statistical inference
*C1
use "data/VOTE1.DTA",clear
describe
regress voteA lexpendA lexpendB prtystrA
generate lexpendB_A=lexpendB-lexpendA
regress voteA lexpendA lexpendB_A prtystrA
*C3
use "data/hprice1.dta",clear
describe
regress lprice sqrft bdrms
generate x1=sqrft-150*bdrms
regress lprice x1 bdrms
*C9
use "data/discrim.dta",clear
describe
regress lpsoda prpblck lincome prppov
correlate lincome prppov
regress lpsoda prpblck lincome prppov lhseval
test (lincome=0) (prppov=0)
correlate lincome prppov lhseval
regress lpsoda prpblck lhseval
display (0.1839-0.1694)/2/(1-0.1839)*396
*C11
use "data/HTV.DTA",clear
describe
generate abilsq=abil^2
regress educ motheduc fatheduc abil abilsq
lincom motheduc-fatheduc
test motheduc=fatheduc
display 1.94^2
regress educ motheduc fatheduc abil abilsq tuit17 tuit18
test (tuit17=0) (tuit18=0)
correlate tuit17 tuit18
generate tuitave=(tuit17+tuit18)/2
regress educ motheduc fatheduc abil abilsq tuitave
summarize educ tuit17 tuit18 tuitave