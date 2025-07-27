// Drop unwanted variables
drop photo enurpt checkout checkoutdate

// Tabulate variable (oneway)
// tabulate consent, missing

// Browse dataset according to consent (if it's null/missing, 1 or 2)
// browse if inlist(consent, ., 1, 2)

drop if inlist(consent, .,2)


// Drop data if id21 is missing (.) or 2
// अध्ययनको लागी बसोबास गर्ने
// Before droping the records, tabulate them
tab id21, missing

// Only show value without label
tab id21, nolabel
tab id21, missing nolabel
drop if id21 == .
drop if id21 == 2

// OR drop multiple values by
drop if inlist(id21, ., 2)

// List out the non-members of the family
tab pi0, missing
browse if pi0 == .
browse if hhid == "3060507020052"

// Drop the data which are empty
drop if hhid == "3060507020052" & pi0 == .

// OR drop in one click
drop if pi0 == .

// Findout if there are missing records
browse if pi3 == .
tab pi3, missing

browse if hhid == "3080225010008"
drop if hhid == "3080225010008" & pi3 == .

// Drop partially or incomplete records
drop if hhid == "3080216020260"
drop if pi1 == ""
drop if pi3 == .

// Replace value, change gender/sex (अन्यबाट महिला बनाउने)
replace pi3 = 2 if hhid == "3060508020028" & pi1 == "कृष्ण माया मिश्र"
replace pi3 = 2 if hhid == "3060209020062" & pi1 == "येसिका बस्नेत"
replace pi3 = 1 if hhid == "3060209020062" & pi1 == "प्रजोल बस्नेत"
replace pi3 = 2 if hhid == "3060503010125" & pi1 == "भक्ति माया श्रेष्ठ"

// Use Regular Expressions
browse if !regexm(id10a, "^T")
browse if regexm(id10a, "^T")

// Define Varialbe Labels
// label variable variable_name "Label of Varialbe"
label variable u_wp "Unique Ward Part (वडा खण्ड)"

// *******************************************************
// *******************************************************
gsort id2 id3 id4 id5 hhid

gen un_hhid = .

levelsof id2, local(l_id2)
foreach d in `l_id2'{
	levelsof id3 if id2 == `d', local(l_id3)
	foreach m in `l_id3'{
		levelsof id4 if id2 == `d' & id3 == `m', local(l_id4)
		foreach w in `l_id4'{
			levelsof id5 if id2 == `d' & id3 == `m' & id4 == `w', local(l_id5)
			foreach wp in `l_id5'{
				egen hh_num = group(id2 id3 id4 id5 hhid date time) if id2 == `d' & id3 == `m' & id4 == `w' & id5 == `wp'
				replace un_hhid = hh_num if id2 == `d' & id3 == `m' & id4 == `w' & id5 == `wp'
				drop hh_num
			}
		}
	}
}

// Generate Unique Household IDs
gen final_hhid = string(id2) + string(id3, "%02.0f") + string(id4, "%02.0f") + string(id5, "%02.0f") + string(un_hhid, "%04.0f") 

// *******************************************************
// *******************************************************



// To generate Unique Household IDs, parsing integer to String and concatenation
// Generate Unique Household ID using concatenation
tostring id2, generate(s_id2) format(%03.0f)
tostring id3, generate(s_id3) format(%02.0f)
tostring id4, generate(s_id4) format(%02.0f)
tostring id5, generate(s_id5) format(%02.0f)
tostring u_hhid, generate(s_u_hhid) format(%04.0f)

gen household_id = s_id2 + s_id3 + s_id4 + s_id5 + s_u_hhid

// // Generate Unique Household ID
// gen final_hhid = (id2 * 10^10) + (id3 * 10^8) + (id4 * 10^6) + (id5 * 10^4) + u_hhid

// Generate Sum of the income of every household members
bysort final_hhid: egen avg_income = sum(pi13)

// Replace value by multiplying with some value
replace avg_income = avg_income * 12 + ha7 + ha8

// Generate average income of individual
// bysort final_hhid: replace avg_income = avg_income(mean)
 bysort final_hhid: egen avg_income_ind = mean(avg_income)
 
//  Count family members
egen count_family_member = count(final_hhid), by(final_hhid)
gen id20_new = .
replace id20_new = count_family_member