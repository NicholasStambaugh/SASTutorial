PROC FORMAT;
VALUE $Region "NE" = "Northeast"
              "NW" = "Northwest"
              "S"  = "South"
              "W"  = "West" 
;
RUN;

PROC FORMAT;
VALUE $HomeType "C" = "Condo/Co-op"
				"S" = "Single Family"
;				
RUN;


PROC IMPORT 
DATAFILE='/home/u56440190/STA 216/TAPS/2011 Home Sales.xlsx'
DBMS=XLSX REPLACE OUT=homes;
GETNAMES=YES;
RUN;

PROC CONTENTS DATA=homes;
RUN;

PROC FREQ data=homes;
title 'Frequency of Values for All Variables';
title2 '2011 Home Sales';
RUN;

PROC PRINT DATA=homes;
TITLE 'Print One'; 
TITLE2 'Print of All Variables'; 
FORMAT Region $Region.;
RUN;

PROC PRINT DATA=homes LABEL;
VAR SalePrice;
TITLE 'Print Three'; 
TITLE2 'Print of SalePrice Variable with Variable Label'; 
FORMAT Region $Region.;
FORMAT Region $Region.;
RUN;



DATA homes;
SET homes;
LABEL SalePrice = 'Price (in dollars) at which home sold'
      Region = 'Region of the United States'
	 HomeType = 'Type of home'
	 Inventory = 'Current value (in dollars) of all items inside the home'
	;
RUN;

PROC PRINT DATA=homes NOOBS LABEL;
TITLE 'Print Two'; 
TITLE2 'Print of All Variables with Variable Labels'; 
RUN;

PROC FREQ data=homes;
table HomeType;
title 'Values for Home Type';
title2 '2011 Home Sales';
FORMAT HomeType $HomeType.;
RUN;

proc means data=homes n min max mean std median skewness kurtosis maxdec=3;
var SalePrice;
title "Select Numerical Summary Statistics";
title2 "Sales Price of Homes";
title3 '2011 Home Sales';
RUN;

PROC SGPLOT data=homes;
Histogram SalePrice / showbins;
title "Histogram of Home Sale Price";
title2 "2011 Home Sales";
RUN;

PROC SGPLOT data=homes;
vbox SalePrice;
title "Boxplot of Home Sale Price";
title2 '2011 Home Sales';
RUN;

PROC UNIVARIATE data=homes plots;
var saleprice;
title "Basic Numerical Summary Statistics";
title2 "Home Sale Price";
title3 "2011 Home Sales";
RUN; 





