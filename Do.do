clear
. use "C:\Users\YOGA 300 CEL\Downloads\BaseC.dta", clear

. label variable var2 "sexo de la personas"

. rename var2 sexo

. label define sexlab 1 "hombre" 0 "mujer"

. label values sexo sexlab


            tabulation:  Freq.   Numeric  Label
                           303         3  matched (3)

. tab sexo

 sexo de la |
   personas |      Freq.     Percent        Cum.
------------+-----------------------------------
      mujer |         97       32.33       32.33
     hombre |        203       67.67      100.00
------------+-----------------------------------
      Total |        300      100.00

. label variable var1 "identificacion personal"

. rename var1 id

. label variable var3 "tipo de angina"

. rename var3 angina

. label define anginat 1 "anginatipica" 2 "anginaatipica" 3 "noanginadol" 4 "asintomatico"

. label values angina anginat

. label variable var4 "presion sistolica"

. rename var4 sist

. label variable var5 "nivel de colesterol"

. rename var5 col

. label variable var6 "electrocardiograma"

. rename var6 electro

. label define electrot 0 "normal" 1 "st-t" 2 "hv"

. label define electrot 0 "normal" 1 "st-t" 2 "hv", replace

. label values electro electrot

. label define electrot 0 "normal" 1 "st-t" 2 "hv", replace

. label variable var7 "años de nacimiento"

. rename var7 nacimiento

. browse

. label variable var8 "nivel de angiografia "

. rename var8 ang

. label variable var9 "fecha del examen"

. rename var9 fechaa

. destring sist, generate(sistolico)
sist contains nonnumeric characters; no generate

. destring sist, generate(sistolico) force
sist contains nonnumeric characters; sistolico generated as int
(5 missing values generated)

. destring col, generate(col1) force
col contains nonnumeric characters; col1 generated as int
(7 missing values generated)

. tabulate dolor ang, colsort

      tipo de | nivel de angiografia 
       angina |         0          1 |     Total
--------------+----------------------+----------
 anginatipica |        16          7 |        23 
anginaatipica |        39          9 |        48 
  noanginadol |        67         18 |        85 
 asintomatico |        37        102 |       139 
--------------+----------------------+----------
        Total |       159        136 |       295 


. generate nacimiento1= date(nacimiento, "MDY")
(9 missing values generated)

. generate edada= (fecha1- nacimiento1)365.25
unknown function ()
r(133);

. generate edada= date(fecha1-nacimiento1)/365.25
invalid syntax
r(198);

. generate fecha2= date(fechaa,"MDY")
(187 missing values generated)

. generate edadmdy=myd(fecha2-nacimiento1)365.25
unknown function myd()
r(133);

. generate edad=(fecha-nacimiento1)/365.25
fecha ambiguous abbreviation
r(111);

. generate edada = (fecha2- nacimiento1)/365.25
(191 missing values generated)

. generate nacimiento 2= date(nacimiento, "DMY)
variable nacimiento already defined
r(110);

. generate nacimiento2= date(nacimiento, "DMY")
(173 missing values generated)

. generate edada1= (fecha1- nacimiento2)/365.25
(174 missing values generated)

. generate edadc=( (19,02,2017) - edad1)/365.25
19,02,2017 invalid name
r(198);

. generate cumpleaños
=exp required
r(100);

. create edad
command create is unrecognized
r(199);


. generate nacdmy=date(nacimiento,"DMY")
(173 missing values generated)

. generate nacmdy=date(nacimiento,"MYD")
(303 missing values generated)

. drop nacmdy

. generate nacmdy=date(nacimiento,"MDY")
(9 missing values generated)

. generate fechamdy=date(fechaa,"MDY")
(187 missing values generated)

. generate fechadmy=date(fechaa,"DMY")
(5 missing values generated)

. tsset fechadmy, format(%tcMon_DD,_CCYY_HH:MM:SS)
repeated time values in sample
r(451);

. tsset nacmdy, format(%tcMon_DD,_CCYY_HH:MM:SS)
repeated time values in sample
r(451);

. generate=(fechadmy-nacmdy)/365.25
too few variables specified
r(102);

. generateedada=(fechadmy-nacmyd)/365.25
command generateedada is unrecognized
r(199);

. generate edada=(fechadmy-nacmdy)/365.25
(14 missing values generated)


. summarize edada, detail

                            edada
-------------------------------------------------------------
      Percentiles      Smallest
 1%     34.54346       29.26763
 5%     40.22177       34.07803
10%     42.41752       34.54346       Obs                 289
25%      48.0794       35.03354       Sum of Wgt.         289

50%     55.74538                      Mean           54.76143
                        Largest       Std. Dev.      8.922574
75%      61.3525       71.67419
90%     65.99863       73.73579       Variance       79.61233
95%     68.04655       76.70911       Skewness      -.2184518
99%     73.73579       77.43189       Kurtosis       2.508676


. tabulate sexo, subpop(edada) nolabel sort

 sexo de la |
   personas |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |        203       67.67       67.67
          0 |         97       32.33      100.00
------------+-----------------------------------
      Total |        300      100.00

 
