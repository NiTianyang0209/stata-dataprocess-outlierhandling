sort stkid year
xtset stkid year 

***  查看后发现，出现因为中途停牌、企业中间年份样本缺失的情况
sort stkid year
by stkid: gen gap = year - year[_n-1] if _n>1&yearlistyear
list stkid year if gap>1

xtset stkid year
tsfill //补全所有年份序列

* 1. 标记"该年是否整条缺失"
gen all_missing = missing(estbyear) & missing(listyear) 

* 2. 标记"该企业是否曾出现过这种情况"
bysort stkid: egen has_all_missing = max(all_missing)

* 3. 统计企业数量 
egen tag = tag(stkid)
count if tag==1 & has_all_missing==1 //**个企业曾出现中间年份停牌无数据的情况

bysort stkid: egen n_gap = total(all_missing)
tab n_gap

label var has_all_missing 是否出现中断
label var n_gap 出现中断的年份数

// gen has_gap2 = (n_gap >= 2)

drop if all_missing==1 
drop all_missing has_all_missing 

