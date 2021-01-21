/* Creating a library */
libname pg1 "/home/u49706966";
run;
 
 
/* Creating a two outputs into a library*/
 
libname out "/home/u49706966";
data class_copy1 out.class_copy2;
	set sashelp.class;
run;


/*Reading or importing excel (xlsx) dataset engine into the library*/
options validvarname=v7;
libname IEID xlsx "/home/u49706966/iEID Implement outcomes.29nov2020.xlsx";

proc contents data=ieid.data;
run;

*Important to clear the libname to prevent active connection to the file;
libname IEID clear;


*Exercises;
*Solution to the questions in sas;

libname NP xlsx "filepath/np_info.xlsl";
run;

*2;
options validvarname=v7;
proc contents data=NP.Parks;
run;
libname NP clear;

*Importing unstructured data;
proc import datafile= "/home/u49706966/MATH660/201612-citibike-tripdata.csv" dbms=csv 
  out= Citibike_dataset replace;
run;

*Completing the proc content step;
proc contents data= Citibike_dataset;
run;


*Importing an xlsx file into sas;
proc import datafile= "/home/u49706966/StateData.xlsx" 
 dbms=xlsx
 out= State_data replace;
 sheet= data;
run;
 

*Exercises
*1;
proc import datafile="filepath/eu_sport_trade.xlsx"
  dbms=xlsx
  out=eu_sport_trade 
  replace;
run;

proc contents data=eu_sport_trade; 
run;


*2;
proc import datafile= "filepath/np_traffic.csv"
	dbms=csv
	out= traffic
	 replace;
run;

proc contents data=traffic;
run;


* Corrected code since Park name and Traffic counter varialble seem to be rtruncates ;
options validvarname=v7;
proc import datafile= "filepath/np_traffic.csv"
	dbms=csv
	out= traffic
	replace;
	guessingrows=max
run;

proc contents data= traffic;
run;

	
*Importing delimited file;
proc import datafile= "/home/u49706966/Exercise.dat"
	dbms=dlm
	out=Exercise
	replace;
	guessingrows=3000;
	delimiter="|";
run;

proc contents data=Exercise;
run;























