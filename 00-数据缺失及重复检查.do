* 查看数据情况 
sum _all
sum _all, d  // 汇报详细数据特征
codebook _all  // 可选codebook varlist 

nmissing  // nmissing [varlist] [if exp] [in range] [, min(#) obs piasm trim ]

mdesc, all  // mdesc varlist [if] [in] [, abbreviate(#) any all none ]

* 删除重复值
duplicates report var  // 显示重复值。根据所有列属性，所有的值都是一样的
duplicates tag,gen(tag)  // 标记重复值。生成一个新变量tag标记重复值
tab tag  // tag=0说明没有重复的变量个数，tag=1说明是重复的变量个数
list _all if tag!=0  // 显示重复的数据是哪几行
drop tag	// 删除tag这个临时变量，否则下次运行会报错

duplicates drop id year,force  // 删除重复中的多余的变量，保留一个
