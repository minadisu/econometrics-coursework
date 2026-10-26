* Chapter 3: Multiple regression
*C3
use "data/CEOSAL2.DTA",clear
describe
sum profits
regress lsalary lsales lmktval
sum profits
count if profits<0
regress lsalary lsales lmktval profits
regress lsalary lsales lmktval profits ceoten
correlate lmktval profits
*C6
use "data/WAGE2.DTA",clear
describe
regress IQ educ
regress lwage educ IQ
display .0391199+ .0058631 *3.533829
*C7
use "data/MEAP93.DTA",clear
describe
regress math10 lexpend lnchprg
regress math10 lexpend
correlate lexpend lnchprg
regress lnchprg lexpend
display 6.22969 -.3045853*(-16.201392)
*C10
use "data/HTV.DTA",clear
describe
summarize educ
count if educ==12
display 512/1230
summarize educ motheduc fatheduc
regress educ motheduc fatheduc
regress educ motheduc fatheduc abil
generate abil2=abil^2
regress educ motheduc fatheduc abil abil2
display -.4014524 /(2* .050599)
summarize abil
count if abil<-3.9670982
display 8.240226+ .1901261 *12.18+ .1089387*12.45
graph twoway (function y=11.91+0.401*x+0.0506*x^2, range(-6 6) xlabel(-6(1)6) xtitle(ability) ytitle(education))
*C13
use "data/GPA1.DTA",clear
describe
regress colGPA PC
regress colGPA PC hsGPA ACT
regress colGPA PC hsGPA ACT fathcoll mothcoll