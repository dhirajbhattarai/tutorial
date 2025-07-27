/*
// Import data from Fixed file format (.dat & .dct) file
 infix using "C:\Users\dyroz\Desktop\POVHIS v6\Central App\Downloaded\Exported.dct", using("C:\Users\dyroz\Desktop\POVHIS v6\Central App\Downloaded\Exported.dat")
*/


// Import or Load data from .dat and .dct
// infix using "filename.dct", using "filename.dat"

/*
// Compressing dataset to save storage
// Compress whole dataset
compress

// Compress individual variables
compress id6

compress id10 id10a consent devid hhid pi1 pi10 pi11 pi11a pi11b pi11c pi11d pi11e pi11f pi11g pi11h pi11i pi11j pi11k pi12 pi13

// Keep dataset if it satisfy the condition
keep if name == "Dhiraj Bhattarai"

// Delete dataset if it satisfy the condition
drop if name != "Dhiraj Bhattarai"

// Clear the output screen
cls

// Clear the loaded dataset
clear

// Print working directory
pwd

// Load dataset
use "C:\Users\dyroz\Desktop\poverty\poverty.dta" 

// If the dataset in same directory
use "poverty.dta"

// OR
use poverty.dta

// OR
use poverty

// Save the dataset in new location or with new name
save "C:\Users\dyroz\Desktop\poverty\poverty.dta"

// Save and replace the dataset
save "C:\Users\dyroz\Desktop\poverty\poverty.dta", replace

// Save just by name or without file extension in working directory
save poverty.dta

// OR
save poverty

// Tabulate the dataset, variable
tabulate age

// Tabulate the missing value as well
tabulate age, missing

// Order or move the variables left or right of some other variables
// Move at the begining
order name
order name age

// Move after one variable (such as name)
order age, after(name)

// Move before one variable (such as address)
order age, before(address)

// Move at the end of all variables
order phone, after(_all)

// Sort dataset in ascending order
sort name

// Sort dataset in descending order
sort ~name

// Browse data if variable is in between certain values
// Browse data if district (id2) is in Kathmandu (306), Lalitpur (307) and Bhaktapur (308)
browse if inlist(id2, 306,307, 308)

// Browse dataset if pi2 == 1 and pi6 != 1
//  pi2 == "परिवारमूली" & pi6 == "विदेशमा  वसोवास गर्ने" 
browse if pi2 == 1 & pi6 != 1

// Get help text on some functions
help sort

// Sort household data
sort id1 id2 id3 id4 id5 date time id10 pi0


// Generate serial number for duplicate householdid
// First sort them with some condition
// bysort id1 id2 id3 id4 id5 date time: gen serial = _n
//
// egen new_hhid = group(id1 id2 id3 id4 id5 date time)

// Browse duplicates household_id
duplicates report hhid if pi2 == 1
duplicates tag hhid if pi2 == 1, generate(dup_hhid)
browse if dup_hhid > 0


egen unique_household_id = group(house_number household_id)  // Generate unique household ID
bysort ward: gen serial = _n  // Generate serial number starting from 1 for each ward


// foreach var1 of varlist age {
//     foreach var2 of varlist gender {
//         bysort `var1' `var2': egen avg_income = mean(income)
//     }
// }


// Define a function to generate an unique household id

program define unique_hhid
	sort id1 id2 id3 id4 id5 id10 date time pi0
	
	foreach hh_id in 

end

// program define calculate_stats
//     args varname
//     summarize `varname'
//     local mean = r(mean)
//     local sd = r(sd)
//     display "The mean of `varname' is " `mean'
//     display "The standard deviation of `varname' is " `sd'
// end

// 
*/


// Clear the output or display window
cls

// Delete data if people rejects to take part in survey
// drop if consent == . & consent == 2
// "अन्तरवार्ता दिन अस्विकार गरेको"
drop if consent == .
drop if consent == 2

// Delete if "id21" is 2 or .
// "यस स्थानमा अध्ययन /छोटो समयको लागि बसेको"
drop if id21 == 2 & id21 == . 

// Browse columns before droping or deleting them
browse id6 consent photo memid photoname photorel enum_status enurpt checkout checkoutdate

// Drop columns or variables which are not needed in analysis
drop id6 consent photo memid photoname photorel enum_status enurpt checkout checkoutdate

// Order or move the variables left or right of some other variables
// Move at the begining
order name
order name age

// Move after one variable (such as name)
order age, after(name)

// Move before one variable (such as address)
order age, before(address)

// Move at the end of all variables
order phone, after(_all)

// Sort dataset in ascending order
sort name

// Sort dataset in descending order
sort ~name

// Browse data if variable is in between certain values
// Browse data if district (id2) is in Kathmandu (306), Lalitpur (307) and Bhaktapur (308)
browse if inlist(id2, 306,307, 308)

// Also you can tabulate and see the total count and frequency
tabulate id2 if inlist(id2, 306, 307, 308)

// Get distinct values from variables
// Get distinct district code (id2)
levelsof id2

// and save these distinct values in local variables `dist'
levelsof id2, local(dist)

// Sort dataset
sort id2 id3 id4 id5 id9 hhid date time pi0

// Generate Unique Household Number (परिवार नम्बर))
// Initialize a new variable for unique household IDs
gen u_hhid = .

levelsof id2, local(l_id2)

foreach d in `l_id2' {
	levelsof id3 if id2 == `d', local(l_id3)
	foreach m in `l_id3' {
		levelsof id4 if id2 == `d' & id3 == `m', local(l_id4)
		foreach w in `l_id4' {
			egen hh_num = group(id2 id3 id4 id5 hhid date time) if id2 == `d' & id3 == `m' & id4 == `w'
// 			bysort id2 id3 id4 id5 hhid date time pi0: gen hh_num = _n if id2 == `d' & id3 == `m' & id4 == `w'
			
			replace u_hhid = hh_num if id2 == `d' & id3 == `m' & id4 == `w'
			drop hh_num
		}
	}
}

// Generate Ward Parts
// Generate Ward Parts for different ganak and different tablets
gen u_wp = .

levelsof id2, local(l_id2)

foreach d in `l_id2' {
	levelsof id3 if id2 == `d', local(l_id3)
	foreach m in `l_id3' {
		levelsof id4 if id2 == `d' & id3 == `m', local(l_id4)
		foreach w in `l_id4' {
			egen new_wp = group(id2 id3 id4 intcode devid) if id2 == `d' & id3 == `m' & id4 == `w'
// 			bysort id2 id3 id4 id5 hhid date time pi0: gen hh_num = _n if id2 == `d' & id3 == `m' & id4 == `w'
			
			replace u_wp = new_wp if id2 == `d' & id3 == `m' & id4 == `w'
			drop new_wp
		}
	}
}

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
//
// // Format Integer
// format final_hhid %13.0f

/*
// * Loop over all distinct districts, municipalities, wards, and ward_parts
levelsof district, local(districts)
foreach d in `districts' {
    levelsof municipality if district == `d', local(municipalities)
    foreach m in `municipalities' {
        levelsof ward if district == `d' & municipality == `m', local(wards)
        foreach w in `wards' {
            levelsof ward_part if district == `d' & municipality == `m' & ward == `w', local(ward_parts)
            foreach wp in `ward_parts' {
                * Generate a unique household ID for each household within the specific ward_part
                bysort district municipality ward ward_part household_id: gen household_number = _n if district == `d' & municipality == `m' & ward == `w' & ward_part == `wp'
                
                * Assign unique household ID
                replace unique_household_id = household_number if district == `d' & municipality == `m' & ward == `w' & ward_part == `wp'
            }
        }
    }
}
*/
