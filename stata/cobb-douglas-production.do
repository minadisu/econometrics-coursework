* Cobb-Douglas production function exercise
clear
input year invest gdp labor
2016 312702.5 761193 76245
2017 350973.2 847382.9 76058
2018 396684.6 919281.1 75782
2019 424984.6 986515.2 75447
2020 433086 1013567 75064
2021 485400.7 1149237 74652
2022 508826.5 1204724 73351
2023 523590.3 1260582 74041
end
gen delta = 0.06
gen K = .
gen K0 = invest[1]/0.1
replace K = K0 if year==2016
forvalues i = 2/7 {
    replace K = (1-delta)*K[`i'-1] + invest[`i'] if _n == `i'
}
list year invest gdp labor K, sep(0)
tsset year
replace labor=labor
gen lnY = ln(gdp)
gen lnK = ln(K)
gen lnL = ln(labor)
keep if year>=2017
reg lnY lnK lnL
display "α+β = " _b[lnK] + _b[lnL]
scalar alpha = _b[lnL]
scalar beta = _b[lnK]
gen gy = D.lnY
gen gk = D.lnK
gen gl = D.lnL
gen ga = gy - alpha*gl - beta*gk
list year gy gl gk ga, sep(0)