clear
cd"C:\Users\dhruv_000\Desktop\COLLEGE STUFF\labor eco\final project"
use 36151-0001-Data.dta

gen Dalit=0
replace Dalit=1 if GROUPS==4

gen Brahmin=0
replace Brahmin=1 if GROUPS==1

gen HighCaste=0
replace HighCaste=1 if GROUPS==2

gen Muslim=0
replace Muslim=1 if GROUPS==6

gen Adivasi=0
replace Adivasi=1 if GROUPS==5

gen OBC=0
replace OBC=1 if GROUPS==3

gen Sikh_jain_christian=0
replace Sikh_jain_christian=1 if GROUPS==7

generate Male=0
replace Male=1 if RO3==1

gen agesq=RO5*RO5
regress WSEARNHOURLY Male ED6 ED3 RO5 agesq Dalit HighCaste Muslim Adivasi OBC Sikh_jain_christian i.STATEID, vce(robust)

*****generating eduation dummies********
gen primary=0
replace primary=1 if ED6==0 | ED6==1| ED6==2| ED6==3| ED6==4 

gen middle=0 
replace middle=1 if ED6==5 | ED6==6| ED6==7| ED6==8

gen senior=0
replace senior=1 if ED6==9 | ED6==10| ED6==11| ED6==12

gen grad=0
replace grad=1 if ED6==13 | ED6==14| ED6==15

gen postgrad=0
replace postgrad=1 if ED6==16

gen GRAD=0
replace GRAD=1 if postgrad==1|grad==1
******************************************

******generating iteraction dummies for dalits*********
gen HighCaste_primary= HighCaste*primary
gen HighCaste_middle= HighCaste*middle
gen HighCaste_senior= HighCaste*senior
gen HighCaste_grad= HighCaste*grad
gen HighCaste_postgrad= HighCaste*postgrad
*******************************************************

*****generating interaction terms for HighCaste*******
gen Dalit_primary= Dalit*primary
gen Dalit_middle= Dalit*middle
gen Dalit_senior= Dalit*senior
gen Dalit_grad= Dalit*grad
gen Dalit_postgrad= Dalit*postgrad
****************************************************

*****generating interaction terms for Muslims*******
gen Muslim_primary= Muslim*primary
gen Muslim_middle= Muslim*middle
gen Muslim_senior= Muslim*senior
gen Muslim_grad= Muslim*grad
gen Muslim_postgrad= Muslim*postgrad
****************************************************

*****generating interaction terms for Brahmin*******
gen Brahmin_primary= Brahmin*primary
gen Brahmin_middle= Brahmin*middle
gen Brahmin_senior= Brahmin*senior
gen Brahmin_grad= Brahmin*grad
gen Brahmin_postgrad= Brahmin*postgrad
****************************************************

*****generating interaction terms for OBC*******
gen OBC_primary= OBC*primary
gen OBC_middle= OBC*middle
gen OBC_senior= OBC*senior
gen OBC_grad= OBC*grad
gen OBC_postgrad= OBC*postgrad
****************************************************


*****generating interaction terms for Adivasi*******
gen Adivasi_primary= Adivasi*primary
gen Adivasi_middle= Adivasi*middle
gen Adivasi_senior= Adivasi*senior
gen Adivasi_grad= Adivasi*grad
gen Adivasi_postgrad= Adivasi*postgrad
****************************************************

*****generating interaction terms for Sikh_jain_christian*******
gen Sikh_jain_christian_primary= Sikh_jain_christian*primary
gen Sikh_jain_christian_middle= Sikh_jain_christian*middle
gen Sikh_jain_christian_senior= Sikh_jain_christian*senior
gen Sikh_jain_christian_grad= Sikh_jain_christian*grad
gen Sikh_jain_christian_postgrad= Sikh_jain_christian*postgrad
****************************************************

******regression with and wothout interactions*********
gen lhourlywage= ln(WSEARNHOURLY)


regress WSEARNHOURLY URBAN2011 Male middle senior grad postgrad ED3 RO5 agesq Dalit Dalit_middle Dalit_senior Dalit_grad Dalit_postgrad  HighCaste Muslim Adivasi OBC Sikh_jain_christian ASSETS i.STATEID, vce(robust)

 set matsize 1000
regress lhourlywage URBAN2011 Male middle senior grad postgrad ED3 RO5 agesq Dalit Dalit_middle Dalit_senior Dalit_grad Dalit_postgrad HighCaste_middle HighCaste_senior HighCaste_grad HighCaste_postgrad Adivasi_middle Adivasi_senior Adivasi_grad Adivasi_postgrad Muslim_middle Muslim_senior Muslim_grad Muslim_postgrad OBC_middle OBC_senior OBC_grad OBC_postgrad Sikh_jain_christian_middle Sikh_jain_christian_senior Sikh_jain_christian_grad Sikh_jain_christian_postgrad  HighCaste Muslim Adivasi OBC Sikh_jain_christian i.DISTRICT i.WS5, vce(robust)

regress lhourlywage URBAN2011 Male RO5 agesq ED6 ED3 Dalit HighCaste Muslim Adivasi OBC Sikh_jain_christian i.DISTRICT, vce(robust)
// ED3=english score, RO5= age
 //[fw=FWT]
regress lhourlywage URBAN2011 Male middle senior grad postgrad ED3 RO5 agesq i.DISTRICT, vce(robust)

// using majors and vocational training

gen vocational=1
replace vocational=0 if CS20==.
gen ED10_1=ED10
replace ED10_1=8 if ED10==.
set matsize 1000
regress lhourlywage i.ED10_1 vocational URBAN2011 Male middle senior grad postgrad ED3 RO5 agesq Dalit Dalit_middle Dalit_senior Dalit_grad Dalit_postgrad HighCaste_middle HighCaste_senior HighCaste_grad HighCaste_postgrad Adivasi_middle Adivasi_senior Adivasi_grad Adivasi_postgrad Muslim_middle Muslim_senior Muslim_grad Muslim_postgrad OBC_middle OBC_senior OBC_grad OBC_postgrad Sikh_jain_christian_middle Sikh_jain_christian_senior Sikh_jain_christian_grad Sikh_jain_christian_postgrad  HighCaste Muslim Adivasi OBC Sikh_jain_christian i.DISTRICT, vce(robust)
// now we do it only for male
gen lhourlywage_male= lhourlywage
replace lhourlywage_male=. if Male==0
regress lhourlywage_male i.ED10_1 vocational URBAN2011 middle senior grad postgrad ED3 RO5 agesq Dalit Dalit_middle Dalit_senior Dalit_grad Dalit_postgrad HighCaste_middle HighCaste_senior HighCaste_grad HighCaste_postgrad Adivasi_middle Adivasi_senior Adivasi_grad Adivasi_postgrad Muslim_middle Muslim_senior Muslim_grad Muslim_postgrad OBC_middle OBC_senior OBC_grad OBC_postgrad Sikh_jain_christian_middle Sikh_jain_christian_senior Sikh_jain_christian_grad Sikh_jain_christian_postgrad  HighCaste Muslim Adivasi OBC Sikh_jain_christian i.DISTRICT i.WS5, vce(robust)


******************************************************
************oxcaca decomposition**********************
gen ox_dalit=0
replace ox_dalit=1 if Dalit==1
replace ox_dalit=. if Brahmin==0 & Dalit==0
ssc install oaxaca
oaxaca lhourlywage ED6 ED3 RO5 agesq URBAN2011 Male, by(ox_dalit) noisily
oaxaca lhourlywage ED6 ED3 RO5 agesq URBAN2011 Male, by(ox_dalit) pooled
*******************************************************
************we do it for postgrad/grad level of booking vis-a-vis bRahmin+forwardcaste*******
gen High_Brahmin=0
replace High_Brahmin=1 if Brahmin==1|HighCaste==1
gen ox_grad=0
replace ox_grad=1 if Dalit==1
replace ox_grad=. if High_Brahmin==0 & Dalit==0
replace ox_grad=. if grad==0 & postgrad==0
oaxaca lhourlywage Male ED3 RO5 agesq URBAN2011, by(ox_grad) noisily

oaxaca lhourlywage Male ED3 RO5 agesq URBAN2011, by(ox_grad) pooled
eststo

esttab, using example.tex
*******************************************************************************************
********mean wage at each level of education graphs*********
preserve
collapse (mean) WSEARNHOURLY, by(ED6) if Dalit==1
scatter WSEARNHOURLY ED6, connect(l)
restore

//suest, years of schooling 
//create dummy
//areg absorb
collapse (mean) WSEARNHOURLY, by(ED6)
scatter WSEARNHOURLY ED6, connect(l)
restore

scatter WSEARNHOURLY ED6 if Dalit==1 || lfit WSEARNHOURLY ED6|| scatter WSEARNHOURLY ED6 if Brahmin==1|| lfit WSEARNHOURLY ED6

twoway (scatter WSEARNHOURLY ED6), by (Dalit), (lfit WSEARNHOURLY ED6)


gen incdalit=0
replace incdalit= INCOMEPC if Dalit==1

gen IncDalit=0
replace IncDalit=WSEARNHOURLY if Dalit==1
replace IncDalit=. if IncDalit==0

preserve
collapse (mean) IncDalit, by(ED6)
scatter IncDalit ED6, connect(l)
restore


gen IncBrahmin=0
replace IncBrahmin=WSEARNHOURLY if Brahmin==1
replace IncBrahmin=. if IncBrahmin==0

summarize INCOMEPC if Brahmin==1 & STATEID==1

preserve
collapse (mean) IncBrahmin, by(ED6)
collapse (mean) IncDalit, by(ED6)
twoway (scatter IncBrahmin ED6 , connect(1))(scatter IncDalit ED6 , connect(1))
restore

gen IncMuslim=0
replace IncMuslim=WSEARNHOURLY if Muslim==1
replace IncMuslim=. if IncMuslim==0

preserve
collapse (mean) IncMuslim, by(ED6)
scatter IncMuslim ED6, connect(l)
restore

gen IncOBC=0
replace IncOBC=WSEARNHOURLY if OBC==1
replace IncOBC=. if IncOBC==0

preserve
collapse (mean) IncOBC, by(ED6)
scatter IncOBC ED6, connect(l)
restore

gr combine Muslim.gph OBC.gph, col(2) iscale(1)

gr combine Brahmin.gph Dalit.gph, col(2) iscale(1)

twoway (scatter IncDalit ED6, msymbol(O))(scatter IncBrahmin ED6 , msymbol(Oh))
************************************************************
outreg2 using industry, append tex

// PROPORTION OF brahmins under graph; 

summarize WSEARNHOURLY if OBC==1 & postgrad==1

