# Accessing-SAS-data-2
Listing the table and column attributes of a dataset, Creating a Libref, Using a library to read Excel files, Importing  xlsx, csv and delimiter dataset using proc import.

/* Listing the table and column attributes of a dataset*/

proc contents data="/home/u49706966/EPG1V2/data/class_birthdate.sas7bdat";

run;



proc contents data="/home/u49706966/EPG1V2/data/storm_summary.sas7bdat";

run;



*Creating a Libref;

libname pg1 "/home/u49706966/EPG1V2";

libname out "/home/u49706966/EPG1V2/output";



data philant_1 philant_2;

set sashelp.class;

run;



*Using a library to read Excel files;

*To force the column naming rule to follow SAS rules;

options validvarname=v7;

libname state xlsx "/home/u49706966/StateData.xlsx";

*it is important to clear the libname after the code;

libname state clear;

*Another one;

options validvarname=v7;

libname xlclass xlsx "/home/u49706966/EPG1V2/data/class.xlsx";



proc contents data=xlclass.class_birthdate;

run;







libname xlclass clear;

*For the storm data;

*Completing the options statement;

options validvarname=v7;

*Completing the libname statement;

libname xlstorm xlsx "/home/u49706966/EPG1V2/data/storm.xlsx";

*Completing the proc content statement;



proc contents data=xlstorm.storm_summary;

run;



*Clear the xlstorm library;

libname xlstorm clear;

* Importing Unstructured data;

*Completing the proc import step;



proc import datafile="/home/u49706966/EPG1V2/data/storm_damage.csv" dbms=csv 

out=Storm_damage_import replace;

run;



*Complete the PROC CONTENTS step;



proc contents data=Storm_damage_import;

run;



*For tab delimiter;



proc import datafile="/home/u49706966/EPG1V2/data/storm_damage.tab" dbms=tab 

out=Storm_damage_tab replace;

run;



proc contents data=Storm_damage_tab;

run;





*For xlsx dataset;

proc import datafile="/home/u49706966/EPG1V2/data/class.xlsx" dbms=xlsx 

out=work.class_test_import replace;

sheet=class_test;

run;



*Exercises;

*Another xlsx dataset;

proc import datafile= "/home/u49706966/EPG1V2/data/eu_sport_trade.xlsx" dbms=xlsx

out= eu_sport_trade replace;

run;



proc contents data= eu_sport_trade;

run;



*csv dataset;

proc import datafile="/home/u49706966/EPG1V2/data/np_traffic.csv" dbms=csv

out= traffic 

replace;

guessingrows=max;

run;



proc contents data=traffic;

run;





*delimiter dataset;

proc import datafile="/home/u49706966/EPG1V2/data/np_traffic.dat" dbms=tab

out=traffic2

replace;

guessingrows=5000;

delimiter="|";

run;

proc contents data=traffic2;

run;



















		
		
