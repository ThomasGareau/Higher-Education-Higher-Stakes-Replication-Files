*THOMAS GAREAU-PAQUETTE
*8/4/2024

*****Code for Redistribution Attitudes and Vote Choice Across the educational Divide*****

clear all

use "/Users/thomasgp/MA_THESIS/ces2019_analyses.dta"

***Step 1: Constructing Deservingness and Welfare State Variables***

***Quebec subset***
gen select=0 
replace select=1 if region==5

******************************************************************************************

***Step 2: Main Analyses 

*Creating Fig. 1, Mean of Deservingnness and Welfare State by education

graph bar (mean)deservingness welfare_state, over(education)

graph bar (mean)deservingness welfare_state, over(education)

*For Welfare State
areg welfare_state i.education agegroup i.gender i.religious_freq i.urban_rural i.region [pw=weights], cluster(region) absorb(region)

coefplot, drop(_cons) xline(0) xtitle(Coefficient)


*For Deservingness
areg deservingness i.education agegroup i.gender i.religious_freq i.urban_rural i.region , cluster(region) absorb(region)

coefplot, drop(_cons) xline(0) xtitle(Coefficient)


********************************************
***********KHB MEDIATION ANALYSES***********
********************************************

**WITH SURVEY WEIGHTS

* Conservative
khb logit conservative education || deservingness welfare_state [pw=weights2], concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* Green Party
khb logit green education || deservingness welfare_state [pw=weights2], concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle

* Liberal
khb logit liberal education || deservingness welfare_state [pw=weights2], concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* NDP
khb logit ndp education || deservingness welfare_state [pw=weights2], concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* People's Party
khb logit people_party education || deservingness welfare_state [pw=weights2], concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* Bloc Quebecois
khb logit bloc education || welfare_state deservingness [pw=weights2] if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle


***********************************************************
************ ROBUSTNESS CHECK #1: WITH BLOCkS *************
***********************************************************

****ROBUSTNESS CHECK #1: WITH BLOCkS****

*Right Bloc
khb logit right_bloc education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) summary disentangle

*Left Bloc
khb logit left_bloc education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) summary disentangle



***************************************************
*** ROBUSTNESS CHECK #2: WITHOUT SURVEY WEIGHTS ***
***************************************************


* Conservative
khb logit conservative education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* Green Party
khb logit green education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle

* Liberal
khb logit liberal education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* NDP
khb logit ndp education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* People's Party
khb logit people_party education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* Bloc Quebecois
khb logit bloc education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle









***************************************************
*** ROBUSTNESS CHECK #3: WITH IMMIGRATION INDEX ***
***************************************************

* Conservative
khb logit conservative education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis immig) vce(cluster region) summary disentangle

* Green Party
khb logit green education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis immig) vce(cluster region) summary disentangle

* Liberal
khb logit liberal education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis immig) vce(cluster region) summary disentangle

* NDP
khb logit ndp education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis immig) vce(cluster region) summary disentangle

* People's Party
khb logit people_party education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis immig) vce(cluster region) summary disentangle

* Bloc Quebecois
khb logit bloc education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis immig) summary disentangle



***************************************************
*** ROBUSTNESS CHECK #4: WITH ABSTAINERS **********
***************************************************

* Conservative
khb logit conservative_abst education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* Green Party
khb logit green_abst education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle

* Liberal
khb logit liberal_abst education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle

* NDP
khb logit ndp_abst education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle

* People's Party
khb logit people_party_abst education || deservingness welfare_state, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.region i.language i.minovis) vce(cluster region) summary disentangle


* Bloc Quebecois
khb logit bloc_abst education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle




*************************************
****ROBUSTNESS CHECK #5: QC ONLY*****
*************************************

* Conservative
khb logit conservative education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

* Green Party
khb logit green education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

* Liberal
khb logit liberal education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

* NDP
khb logit ndp education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

* People's Party
khb logit people_party education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

* Bloc Quebecois
khb logit bloc education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

*Right Bloc
khb logit right_bloc education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

*Left Bloc
khb logit left_bloc education || welfare_state deservingness if select==1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle




**************************************
****ROBUSTNESS CHECK #6: ROC ONLY*****
**************************************

* Conservative
khb logit conservative education || welfare_state deservingness if select!=1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

* Green Party
khb logit green education || welfare_state deservingness if select!=1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

* Liberal
khb logit liberal education || welfare_state deservingness if select!=1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

* NDP
khb logit ndp education || welfare_state deservingness if select!=1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle

* People's Party
khb logit people_party education || welfare_state deservingness if select!=1, concomitant(i.agegroup i.gender i.religious_freq i.urban_rural i.language i.minovis) summary disentangle



******************************************************************************************
******************************************************************************************
******************************************************************************************
******************************************************************************************
