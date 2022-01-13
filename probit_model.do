cd"C:\Users\dhruv_000\Desktop\COLLEGE STUFF\Independent Study Module\IHDS survey\Survey 2\ICPSR_36151\DS0001"
use 36151-0001-Data.dta
clear
replace grad_postgrad=. if RO5<18


mprobit grad_postgrad Female URBAN2011 i.GROUPS, vce(robust)
margins, dydx(*) atmeans


mlogit grad_postgrad Male URBAN2011 i.GROUPS, vce(robust)
margins, dydx(*) atmeans

mfx, predict(pr outcome(1))
mfx, predict(pr outcome(0))
probit grad Male URBAN2011 i.GROUPS, vce(robust)

gen grad1=grad
gen lincomepc=log(INCOMEPC)
centile lincomepc if Dalit==1, centile(25,50,75)
centile lincomepc if Brahmin==1, centile(25,50,75)
centile lincomepc if OBC==1, centile(25,50,75)
centile lincomepc if Muslim==1, centile(25,50,75)
