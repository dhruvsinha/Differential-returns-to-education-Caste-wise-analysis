gen female=0
replace female=1 if Male==1
******generating iteraction dummies for HighCaste*********
gen HighCaste_primary_female= HighCaste*primary*female
gen HighCaste_middle_female= HighCaste*middle*female
gen HighCaste_senior_female= HighCaste*senior*female
gen HighCaste_GRAD_female= HighCaste*GRAD*female
gen HighCaste_GRAD= HighCaste*GRAD
*******************************************************

*****generating interaction terms for Dalits*******
gen Dalit_primary_female= Dalit*primary*female
gen Dalit_middle_female= Dalit*middle*female
gen Dalit_senior_female= Dalit*senior*female
gen Dalit_GRAD_female= Dalit*GRAD*female
gen Dalit_GRAD= Dalit*GRAD

****************************************************

*****generating interaction terms for Muslims*******
gen Muslim_primary_female= Muslim*primary*female
gen Muslim_middle_female= Muslim*middle*female
gen Muslim_senior_female= Muslim*senior*female
gen Muslim_GRAD_female= Muslim*GRAD*female
gen Muslim_GRAD= Muslim*GRAD
****************************************************

*****generating interaction terms for Brahmin*******
gen Brahmin_primary_female= Brahmin*primary*female
gen Brahmin_middle_female= Brahmin*middle*female
gen Brahmin_senior_female= Brahmin*senior*female
gen Brahmin_GRAD_female= Brahmin*GRAD*female
gen Brahmin_GRAD= Brahmin*GRAD

****************************************************

*****generating interaction terms for OBC*******
gen OBC_primary_female= OBC*primary*female
gen OBC_middle_female= OBC*middle*female
gen OBC_senior_female= OBC*senior*female
gen OBC_GRAD_female= OBC*GRAD*female
gen OBC_GRAD= OBC*GRAD

****************************************************


*****generating interaction terms for Adivasi*******
gen Adivasi_primary_female= Adivasi*primary*female
gen Adivasi_middle_female= Adivasi*middle*female
gen Adivasi_senior_female= Adivasi*senior*female
gen Adivasi_GRAD_female= Adivasi*GRAD*female
gen Adivasi_GRAD= Adivasi*GRAD


****************************************************

*****generating interaction terms for Sikh_jain_christian*******
gen Sikh_primary_female= Sikh_jain_christian*primary*female
gen Sikh_middle_female= Sikh_jain_christian*middle*female
gen Sikh_senior_female= Sikh_jain_christian*senior*female
gen Sikh_GRAD_female= Sikh_jain_christian*GRAD*female

regress lhourlywage_male i.ED10_1 vocational URBAN2011 middle senior grad postgrad ED3 RO5 agesq Dalit Dalit_middle Dalit_senior Dalit_grad Dalit_postgrad HighCaste_middle HighCaste_senior HighCaste_grad HighCaste_postgrad Adivasi_middle Adivasi_senior Adivasi_grad Adivasi_postgrad Muslim_middle Muslim_senior Muslim_grad Muslim_postgrad OBC_middle OBC_senior OBC_grad OBC_postgrad Sikh_jain_christian_middle Sikh_jain_christian_senior Sikh_jain_christian_grad Sikh_jain_christian_postgrad  HighCaste Muslim Adivasi OBC Sikh_jain_christian Dalit_middle_female Dalit_senior_female Dalit_GRAD_female HighCaste_middle_female HighCaste_senior_female HighCaste_GRAD_female Adivasi_middle_female Adivasi_senior_female Adivasi_GRAD_female Muslim_middle_female Muslim_senior_female Muslim_GRAD_female OBC_middle_female OBC_senior_female OBC_GRAD_female Sikh_middle_female Sikh_senior_female Sikh_GRAD_female i.DISTRICT , vce(robust)

Dalit_middle_female Dalit_senior_female Dalit_GRAD_female HighCaste_middle_female HighCaste_senior_female HighCaste_GRAD_female Adivasi_middle_female Adivasi_senior_female Adivasi_GRAD_female Muslim_middle_female Muslim_senior_female Muslim_GRAD_female OBC_middle_female OBC_senior_female OBC_GRAD_female Sikh_middle_female Sikh_senior_female Sikh_GRAD_female i.DISTRICT , vce(robust)

