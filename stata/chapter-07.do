* Chapter 7: Qualitative regressors and interactions
*C2
use "data/WAGE2.DTA",clear
describe
regress lwage educ exper tenure married black south urban
regress lwage educ c.exper##c.exper c.tenure##c.tenure married black south urban
test c.exper#c.exper=c.tenure#c.tenure=0
regress lwage c.educ##i.black exper tenure married south urban
regress wage educ exper tenure married##black south urban
ereturn list
matrix list e(b)
display _b[1.black]+_b[1.married#1.black]
test _b[1.black]+_b[1.married#1.black]=0
generate married_black=0
replace married_black=1 if married==1 & black==1
generate married_nonblack=0
replace married_nonblack=1 if married==1 & black==0
generate single_black=0
replace single_black=1 if married==0 & black==1
generate single_nonblack=0
replace single_nonblack=1 if married==0 & black==0
regress wage educ exper tenure south urban married_black single_black single_nonblack
*C6
use "data/SLEEP75.DTA",clear
describe sleep totwrk educ age agesq yngkid male
regress sleep totwrk educ age agesq yngkid if male == 1
regress sleep totwrk educ age agesq yngkid if male == 0
generate male_totwrk = male * totwrk
generate male_educ = male * educ
generate male_age = male * age
generate male_agesq = male * agesq
generate male_yngkid = male * yngkid
regress sleep totwrk educ age agesq yngkid male male_totwrk male_educ male_age male_agesq male_yngkid
// 联合检验：是否所有与性别相关的项整体显著
test male = male_totwrk = male_educ = male_age = male_agesq = male_yngkid = 0
regress sleep totwrk educ age agesq yngkid male male#c.totwrk male#c.educ male#c.age male#c.agesq male#yngkid
regress sleep totwrk educ age agesq yngkid male male_totwrk male_educ male_age male_agesq male_yngkid
// 检验交互项是否显著（不包括 male 本身）
test male_totwrk = male_educ = male_age = male_agesq = male_yngkid = 0
*C11
use "data/401ksubs.dta",clear
describe
summarize nettfa
regress nettfa e401k
regress nettfa e401k c.inc##c.inc c.age##c.age
generate interaction1 = e401k * (age - 41)
generate interaction2 = e401k * ((age - 41)^2)
regress nettfa e401k c.inc##c.inc c.age##c.age interaction1 interaction2
generate fsize1 = 0
replace fsize1 = 1 if fsize == 1
generate fsize2 = 0
replace fsize2 = 1 if fsize == 2
generate fsize3 = 0
replace fsize3 = 1 if fsize == 3
generate fsize4 = 0
replace fsize4 = 1 if fsize == 4
generate fsize5 = 0
replace fsize5 = 1 if fsize >= 5
regress nettfa e401k c.inc##c.inc c.age##c.age fsize2 fsize3 fsize4 fsize5
test fsize2 = fsize3 = fsize4 = fsize5 = 0
scalar SSR_r = e(rss)
forvalues i = 1(1)5 {
    regress nettfa e401k c.inc##c.inc c.age##c.age if fsize`i' == 1
    scalar SSR_ur`i' = e(rss)
}
display SSR_ur1 + SSR_ur2 + SSR_ur3 + SSR_ur4 + SSR_ur5
display (SSR_r - (SSR_ur1 + SSR_ur2 + SSR_ur3 + SSR_ur4 + SSR_ur5)) / 20 / (SSR_ur1 + SSR_ur2 + SSR_ur3 + SSR_ur4 + SSR_ur5) * 9245
display Ftail(20, 9245, 3.543)