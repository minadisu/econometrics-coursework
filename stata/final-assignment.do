clear
input year invest gdp labor
2019 424984.6 986515.2 78030
2020 433086 1013567 76810
2021 485400.7 1149237 78550
2022 508826.5 1204724 77880
2023 523590.3 1260582 77730
end
* 设置时间序列
tsset year
* 初始资本存量 = 投资 / 0.1
gen capital = .
replace capital = invest/0.1 in 1
* 使用时间序列lag自动递推计算资本存量
forvalues i = 2/5 {
    replace capital = (1 - 0.06)*L.capital + invest in `i'
}
list year invest capital, sep(0)
gen lnY = ln(gdp)
gen lnK = ln(capital)
gen lnL = ln(labor)
drop if missing(lnY, lnK, lnL)
reg lnY lnK lnL
display "α + β = " _b[lnK] + _b[lnL]