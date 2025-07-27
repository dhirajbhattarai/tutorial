

use "C:\Users\rnsna\OneDrive\Desktop\New folder\Analysis 10 districts merged.dta" 

drop if house_condition==2
drop if house_condition==. 

gen _phone=1 if (landline==1 | mobile==1)
replace _phone=0 if landline==2 & mobile==2
gen _tv=1 if tv==1
replace _tv=0 if tv==2
gen ethnic_code=cast

gen _internet=1 if internet==1
replace _internet=0 if internet==2

recode ethnic_code (2 = 1 "पाहाडी बाहुन") ///
	(1 14 20 = 2 "क्षेत्री") /// Sanyasi/Dashnami (20) added 
	(27 48 49 51 = 3 "तराइ बाहुन") /// Rajput (48) from group-11
	(9	16	18	19	25	26	28	31	33	34	37	43	47	50	55	58	59	72	76	121 = 4 "तराइ मध्यम जाती") /// Koiri/Kushwaha (18) & Kathawaniya/Baniya (28) from group-6,11
	(8 12 15 38 79 82 = 5 "पहाडी दलित") ///
	(17	22	23	39	40	41	54	56	70	75	85	100	101	102	103	108	113	116 = 6 "तराइ दलित") /// Kahar (56) from group-4
	(6 69= 7 "नेवार र थकाली") ///
	(3	5	10	11	13	24	29	32	36	42	46	60	62	65	66	67	71	74	77	78	80	81	84	89	90	93	95	96	98	99	104	105	106	109	110	111	112	114	115	117	118	119	120	122	123	124	125 = 8 "Hills Janajati") /// Khawas (106) from group-9
	(4	21	30	35	44	45	52	53	57	61	63	64	68	83	87	88	91	92	94	97	107 = 9 "तराइ जनजाती") ///
	(7 = 10 "मुस्लिम") ///
	(73	86	126	127	128	129	130 . 999 = 11 "अन्य"), gen(head_ethgroup)	

tab head_ethgroup, gen(head_ethgroup_)

gen hhsize=family_member
replace hhsize=7 if family_member>=7
replace hhsize=. if family_member==.

gen _Ihown=house_owner
replace _Ihown=3 if house_owner>=3

gen _Ifoundation=house_foundation

gen _Iwall=house_wall

gen _Iroof=roof_type

gen _Iwater=1 if water_source==1
replace _Iwater=2 if water_source>=2 & water_source<=3
replace _Iwater=3 if water_source>=4 & water_source<=5
replace _Iwater=4 if water_source==6

gen _Itoilet=toilet_type

gen _Ilight=light_source

gen _Icookfuel=1 if cooking_fuel==3
replace _Icookfuel=2 if cooking_fuel==2
replace _Icookfuel=2 if cooking_fuel==5
replace _Icookfuel=3 if cooking_fuel==1
replace _Icookfuel=1 if cooking_fuel==6
replace _Icookfuel=4 if cooking_fuel==4

gen headedu=1 if hdedu>=1 & hdedu<2
replace headedu=2 if hdedu>=2 & hdedu<3
replace headedu=3 if hdedu>=3 & hdedu<4
replace headedu=4 if hdedu>=4 & hdedu<5
replace headedu=5 if hdedu>=5 

save "C:\Users\rnsna\OneDrive\Desktop\New folder\Analysis 10 districts final.dta" 

use "C:\Users\rnsna\OneDrive\Desktop\New folder\Analysis 10 districts final.dta", clear

gen belt=2 if dist==108
replace belt=2 if dist==405
replace belt=2 if dist==410
replace belt=3 if dist>=110 & dist<=113
replace belt=3 if dist==313
replace belt=3 if dist==408
replace belt=3 if dist==507

gen dev_region=1 if dist>=108 & dist<=113
replace dev_region=2 if dist==313
replace dev_region=3 if dist>=405 & dist<=410
replace dev_region=3 if dist==507

gen belt_2=1 if belt==2
replace belt_2=0 if belt==3
gen belt_3=1 if belt==3 
replace belt_3=0 if belt==2

gen dev_region_1=1 if dev_region==1
replace dev_region_1=0 if dev_region>=2
gen dev_region_2=1 if dev_region==2
replace dev_region_2=0 if dev_region==1 
replace dev_region_2=0 if dev_region==3
gen dev_region_3=1 if dev_region==3
replace dev_region_3=0 if dev_region<=2

save "C:\Users\rnsna\OneDrive\Desktop\New folder\Analysis 10 districts final.dta", replace

use "C:\Users\rnsna\OneDrive\Desktop\New folder\Analysis 10 districts final.dta", clear

xi i._Ifoundation i._Iwall i._Ihown i._Icookfuel i._Iroof i._Iwater ///
i._Ilight i._Itoilet i.hhsize i.headedu
 
global xvar phone_1	tv_1 internet_1 abs hhsize_2 hhsize_3 hhsize_4 hhsize_5 hhsize_6 hhsize_7 hdedu_2 hdedu_3 ///
hdedu_4 hdedu_5 head_ethgroup_2 head_ethgroup_3 head_ethgroup_4 head_ethgroup_5 head_ethgroup_6 ///
head_ethgroup_8 head_ethgroup_9 head_ethgroup_10 head_ethgroup_11 ///
 _Ihown_2 _Ihown_3 _Ifoundtn_2 _Ifoundtn_3 ///
_Ifoundtn_4 _Ifoundtn_5 _Ioutwall_2 _Ioutwall_3 _Ioutwall_4 _Ioutwall_5 _Iroof_2 _Iroof_3 _Iroof_4 ///
_Ioutwall_6 _Iroof_5 _Iwater_2 _Iwater_3 _Iwater_4 _Itoilet_2 _Itoilet_3 head_ethgroup_2 _Ilight_2 ///
_Ilight_3 _Ilight_4 _Ilight_5 _Icookfuel_2 _Icookfuel_4 _Icookfuel_3

save "C:\Users\rnsna\OneDrive\Desktop\New folder\Analysis 10 districts final.dta", replace

use "C:\Users\rnsna\OneDrive\Desktop\New folder\Analysis 10 districts final.dta", clear


***PMT score*

gen double score=_phone*0.18602815 + ///
_tv*0.16623318 + ///
_internet*0.11774429 + ///
belt_2*0.06952441 + ///
belt_3*0.16062171 + ///
dev_region_2*-0.06073778 + ///
dev_region_3*-0.07531879 + ///
abs*0.0710856 + ///
_Ihhsize_2*-0.28157843 + ///
_Ihhsize_3*-0.44481858 + ///
_Ihhsize_4*-0.59261517 + ///
_Ihhsize_5*-0.70204915 + ///
_Ihhsize_6*-0.78827521 + ///
_Ihhsize_7*-0.89485254 + ///
_Iheadedu_2*0.05246117 + ///
_Iheadedu_3*0.12816799 + ///
_Iheadedu_4*0.18964806 + ///
_Iheadedu_5*0.22510974 + ///
head_ethgroup_10*-0.00082965 + ///
head_ethgroup_3*-0.12785991 + ///
head_ethgroup_4*-0.06245297 + ///
head_ethgroup_5*-0.10612885 + ///
head_ethgroup_6*-0.10612349 + ///
head_ethgroup_7*-0.0750+///
head_ethgroup_8*-0.05296236 + ///
head_ethgroup_9*-0.0363885 + ///
head_ethgroup_11*-0.06088778 + ///
_I_Ihown_2*-0.26662479 + ///
_I_Ihown_3*-0.137684 + ///
_I_Ifoundat_2*-0.15708771 + ///
_I_Ifoundat_3*-0.18995139 + ///
_I_Ifoundat_4*-0.23953576 + ///
_I_Ifoundat_5*-0.1412309 + ///
_I_Iwall_2*-0.03237216 + ///
_I_Iwall_3*0.05361847 + ///
_I_Iwall_4*-0.09904848 + ///
_I_Iwall_5*-0.06099104 + ///
_I_Iroof_2*0.01284158 + ///
_I_Iroof_3*-0.06755827 + ///
_I_Iroof_4*-0.1028381 + ///
_I_Iwall_6*0.05156705 + ///
_I_Iroof_5*0.09702118 + ///
_I_Iwater_2*-0.02398577 + ///
_I_Iwater_3*-0.00670447 + ///
_I_Iwater_4*-0.05603952 + ///
_I_Itoilet_2*-0.09293954 + ///
_I_Itoilet_3*-0.17449267 + ///
head_ethgroup_2*0.02854103 + ///
_I_Ilight_2*0.01440182 + ///
_I_Ilight_3*-0.59150148 + ///
_I_Ilight_4*-0.10402905 + ///
_I_Ilight_5*-0.13963202 + ///
_I_Icookfue_2*0.01008072 + ///
_I_Icookfue_4*-0.14486511 + ///
_I_Icookfue_3*-0.06652365 + ///
11.237747   

gen double score1=_phone*0.1860 + ///
_tv*0.1662 + ///
_internet*0.1177 + ///
belt_2*0.0695 + ///
belt_3*0.16062 + ///
dev_region_2*-0.0607 + ///
dev_region_3*-0.0753 + ///
abs*0.0711 + ///
_Ihhsize_2*-0.2816 + ///
_Ihhsize_3*-0.4448 + ///
_Ihhsize_4*-0.5926 + ///
_Ihhsize_5*-0.7020 + ///
_Ihhsize_6*-0.7883 + ///
_Ihhsize_7*-0.8949 + ///
_Iheadedu_2*0.0525 + ///
_Iheadedu_3*0.1282 + ///
_Iheadedu_4*0.1896 + ///
_Iheadedu_5*0.2251 + ///
head_ethgroup_10*-0.0008 + ///
head_ethgroup_3*-0.1279 + ///
head_ethgroup_4*-0.0625 + ///
head_ethgroup_5*-0.1061 + ///
head_ethgroup_6*-0.1061 + ///
head_ethgroup_7*-0.0750+///
head_ethgroup_8*-0.0530 + ///
head_ethgroup_9*-0.0364 + ///
head_ethgroup_11*-0.0609 + ///
_I_Ihown_2*-0.2666 + ///
_I_Ihown_3*-0.1377 + ///
_I_Ifoundat_2*-0.1571 + ///
_I_Ifoundat_3*-0.1900 + ///
_I_Ifoundat_4*-0.2395 + ///
_I_Ifoundat_5*-0.1412 + ///
_I_Iwall_2*-0.0324 + ///
_I_Iwall_3*0.0536 + ///
_I_Iwall_4*-0.0990 + ///
_I_Iwall_5*-0.0610 + ///
_I_Iroof_2*0.0128 + ///
_I_Iroof_3*-0.0676 + ///
_I_Iroof_4*-0.1028 + ///
_I_Iwall_6*0.0516 + ///
_I_Iroof_5*0.0970 + ///
_I_Iwater_2*-0.0240 + ///
_I_Iwater_3*-0.0067 + ///
_I_Iwater_4*-0.0560 + ///
_I_Itoilet_2*-0.0929 + ///
_I_Itoilet_3*-0.1745 + ///
head_ethgroup_2*0.0285 + ///
_I_Ilight_2*0.0144 + ///
_I_Ilight_3*-0.5915 + ///
_I_Ilight_4*-0.1040 + ///
_I_Ilight_5*-0.1396 + ///
_I_Icookfue_2*0.0101 + ///
_I_Icookfue_4*-0.1449 + ///
_I_Icookfue_3*-0.0665 + ///
11.237744   

save "C:\Users\rnsna\OneDrive\Desktop\New folder\Analysis 10 districts final.dta", replace

use "C:\Users\rnsna\OneDrive\Desktop\New folder\Analysis 10 districts final.dta", clear

gen exp_consum=exp(score)
gen total_consum=monthly_income*12+exp_consum
gen per_capita_cons=total_consum/hhsize

gen poor_hh_new=1 if per_capita_cons<22920
replace poor_hh_new=2 if per_capita_cons>=22920
ta poor_hh_new
label define poor_hh_new 1 "poor" 2 "non poor"
label val poor_hh_new poor_hh_new


save "C:\Users\rnsna\OneDrive\Desktop\New folder\poor.dta", replace



use "C:\Users\rnsna\OneDrive\Desktop\New folder\poor.dta", clear

gen laptop_dicho=1 if laptop==1
replace laptop_dicho=0 if laptop==2
replace laptop_dicho=0 if laptop==.

gen four_wheeler_dicho=1 if four_wheeler==1
replace four_wheeler_dicho=0 if four_wheeler==2
replace four_wheeler_dicho=0 if four_wheeler==.

gen two_wheeler_dicho=1 if two_wheeler==1
replace two_wheeler_dicho=0 if two_wheeler==2
replace two_wheeler_dicho=0 if two_wheeler==.

gen air_condition_dicho=1 if air_condition==1
replace air_condition_dicho=0 if air_condition==2
replace air_condition_dicho=0 if air_condition==.

gen washing_machine_dicho=1 if washing_machine==1
replace washing_machine_dicho=0 if washing_machine==2
replace washing_machine_dicho=0 if washing_machine==.

gen sophist_asset=laptop_dicho+four_wheeler_dicho+two_wheeler_dicho+air_condition_dicho

gen exclusion=1 if (four_room==1 | sophist_asset>=2 | washing_machine==1)
replace exclusion=2 if (four_room==2 & sophist_asset<2 & washing_machine==2)
replace exclusion=2 if exclusion==.

label define exclusion 1 "excluded as non poor" 2 "not excluded"
label val exclusion exclusion

save "C:\Users\rnsna\OneDrive\Desktop\New folder\poor_excluded.dta", replace

***Automatic inclusion categorization***
use "C:\Users\rnsna\OneDrive\Desktop\New folder\poor_excluded.dta", clear
gen other_house_dicho=0 if other_house==1
replace other_house_dicho=1 if other_house==2
replace other_house_dicho=1 if other_house==.

gen house_quality_dicho=1 if house_quality==1
replace house_quality_dicho=0 if house_quality==2
replace house_quality_dicho=0 if house_quality==.

gen perm_income_dicho=0 if permanent_income==1
replace perm_income_dicho=1 if permanent_income==2
replace perm_income_dicho=1 if permanent_income==.

gen income_source_dicho=0 if income_source==1
replace income_source_dicho=0 if income_source==2
replace income_source_dicho=0 if income_source==3
replace income_source_dicho=1 if income_source==4
replace income_source_dicho=1 if income_source==5
replace income_source_dicho=0 if income_source==6
replace income_source_dicho=0 if income_source==.

gen dom_worker_dicho=1 if domestic_worker==1
replace dom_worker_dicho=0 if domestic_worker==2
replace dom_worker_dicho=0 if domestic_worker==.

gen underage_hd_dicho=1 if underage_head==1
replace underage_hd_dicho=0 if underage_head==2
replace underage_hd_dicho=0 if underage_head==.

gen all_disable_dicho=1 if all_disable==1
replace all_disable_dicho=0 if all_disable==2
replace all_disable_dicho=0 if all_disable==.

gen all_senior_dicho=1 if all_senior==1
replace all_senior_dicho=0 if all_senior==2
replace all_senior_dicho=0 if all_senior==.

gen incl_housing=1 if (other_house==2 | house_quality==1)
replace incl_housing=0 if (other_house==1 & house_quality==2)
replace incl_housing=0 if (other_house==. & house_quality==.)

gen incl_income=1 if (permanent_income==2 & (underage_head==1 | all_senior==1))
replace incl_income=0 if (permanent_income==1 | (underage_head==2 & all_senior==2))
replace incl_income=0 if (permanent_income==. & underage_head==2 & all_senior==2)


gen inclusion_score=incl_housing+incl_income+ all_disable_dicho+ all_senior_dicho

gen inclusion=1 if inclusion_score>=1
***replace inclusion=2 if inclusion_score==1***
replace inclusion=2 if inclusion_score==0
label define inclusion 1 "included as poor" 2 "not included as Poor"
label val inclusion inclusion

save "C:\Users\rnsna\OneDrive\Desktop\New folder\poor_incl_excl.dta"

use "C:\Users\rnsna\OneDrive\Desktop\New folder\poor_incl_excl.dta" clear

***gen poorhh_select=1 if exclusion==2***
***replace poorhh_select=1 if exclusion==2 & inclusion_score>=2***
***replace poorhh_select=1 if exclusion==2 & inclusion_score<=1 & per_capita_cons<22920***
***replace poorhh_select=2 if exclusion==1***
***replace poorhh_select=2 if per_capita_cons>=22920***

gen poorhh_select=1 if exclusion==2
replace poorhh_select=1 if inclusion==1
replace poorhh_select=1 if poor_hh_new==1
replace poorhh_select=2 if exclusion==1
replace poorhh_select=2 if poor_hh_new==2

save "C:\Users\rnsna\OneDrive\Desktop\New folder\poorhh_selected.dta"

keep if dist==108 | dist==110 | dist==111 | dist==112 | dist==113 | dist==313 | dist==405 | dist==408 | dist==410 | dist==507
keep if dist_name=="तेहैरथुम " | dist_name==" इलाम " | dist_name==" झापा " |dist_name==" मोर‌‌‌ग " | dist_name=="सुनसरी " | dist_name==" चितवन" | dist_name=="कास्की " | dist_name=="नवलपरासी पूर्व" | dist_name=="  पर्वत " | dist_name=="नवलपरासी पश्चिम" 



***replace poorhh_select=2 if exclusion==2 & ropani>=25 & per_capita_cons<22920***  


use "C:\Users\rnsna\OneDrive\Desktop\New folder\poorhh_selected.dta", clear
gen poor_category=1 if poorhh_select==1 & per_capita_cons<11460
replace poor_category=2 if poorhh_select==1 & per_capita_cons>=11460 & per_capita_cons<18336
replace poor_category=3 if poorhh_select==1 & per_capita_cons>=18336
replace poor_category=4 if poorhh_select==2
label define poor_category 1 "अति गरिब" 2 "मध्यम गरिब" 3 "सामान्य गरिब" ///
4 "गैर गरिब"
label val poor_category poor_category

save "C:\Users\rnsna\OneDrive\Desktop\New folder\poor_categoryd.dta"

use "C:\Users\rnsna\OneDrive\Desktop\New folder\poorhh_category.dta", clear

keep if poor_category>=1 & poor_category<=3
save "C:\Users\rnsna\OneDrive\Desktop\New folder\poorhh_list.dta"

*****Data export in excel***

use "C:\Users\rnsna\OneDrive\Desktop\PHIS 10 districts Final\poor_category.dta"

ta district_name poor_category, row

putexcel set "C:\Users\rnsna\OneDrive\Desktop\PHIS 10 districts Final\book5.xlsx", sheet(Book5)
