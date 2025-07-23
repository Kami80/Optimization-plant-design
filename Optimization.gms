Variables
         f;
Positive Variables
         CRUDE
         FGAD
         SRG
         FGCC
         FGRF
         SRGPG
         RFGPG
         SRNPG
         CCGPG
         PG
         SRN
         SRNRF
         RFG
         SRGRG
         RFGRG
         SRNRG
         CCGRG
         RG
         SRDS
         SRFO
         SRDSCC
         SRFOCC
         CCG
         CCFO
         SRNDF
         CCFODF
         SRDSDF
         SRFODF
         DF
         CCFOFO
         SRDSFO
         SRFOFO
         FO
         V14
         V45
         V67
         V910
         ;

Equations
         tank1
         tank2
         tank3
         tank4
         AtmDi
         CataRe
         CataCr
         V1
         V2
         V3
         V4
         V5
         V6
         V7
         V8
         V9
         V10
         V11
         eq1
         eq2
         eq3
         eq4
         eq5
         eq6
         eq7
         eq8
         eq9
         eq10
         eq11
         eq12
         eq13
         OctanPG
         OctanRG
         StPressurPG
         StPressurRG
         SulfurDf
         SulfurFO
         AtDi
         CtRe
         CtCr
         mineq1
         mineq2
         mineq3
         mineq4
         Main ;


tank1 ..   PG =e= SRGPG+RFGPG+SRNPG+CCGPG ;
tank2 ..   RG =e= SRGRG+RFGRG+SRNRG+CCGRG ;
tank3 ..   DF =e= SRNDF+CCFODF+SRDSDF+SRFODF ;
tank4 ..   FO =e= CCFOFO+SRDSFO+SRFOFO ;

AtmDi ..   CRUDE =e= FGAD+SRG+SRN+SRDS+SRFO ;
CataRe..   RFG =e= FGRF+SRNRF ;
CataCr..   SRDSCC+SRFOCC =e= FGCC+CCG+CCFO ;

V1    ..   SRN =e= SRNRF+V14 ;
V2    ..   RFG =e= RFGPG+RFGRG ;
V3    ..   SRG =e= SRGPG+SRGRG ;
V4    ..   V14 =e= V45+SRNDF ;
V5    ..   V45 =e= SRNPG+SRNRG ;
V6    ..   SRDS =e= V67+SRDSCC ;
V7    ..   V67 =e= SRDSDF+SRDSFO ;
V8    ..   CCG =e= CCGPG+CCGRG ;
V9    ..   SRFO =e= SRFOCC+V910 ;
V10   ..   V910 =e= SRFODF+SRFOFO ;
V11   ..   CCFO =e= CCFODF+CCFOFO ;

eq1   ..   FGAD =e= 0.028*CRUDE ;
eq2   ..   SRG =e= 0.236*CRUDE  ;
eq3   ..   SRN =e= 0.223*CRUDE  ;
eq4   ..   SRDS =e= 0.087*CRUDE ;
eq5   ..   SRFO =e= 0.426*CRUDE  ;
eq6   ..   FGRF =e= 0.138*SRNRF   ;
eq7   ..   RFG =e= 0.862*SRNRF    ;
eq8   ..   FGCC =e= 0.273*SRDSCC ;
eq9   ..   CCG =e= 0.536*SRDSCC   ;
eq10  ..   CCFO =e= 0.191*SRDSCC  ;
eq11  ..   FGCC =e= 0.273*SRFOCC  ;
eq12  ..   CCG =e= 0.536*SRFOCC   ;
eq13  ..   CCFO =e= 0.191*SRFOCC  ;

OctanPG       ..  -14.5*SRGPG+11.1*RFGPG-27.9*SRNPG+0.5*CCGPG =g= 0 ;
OctanRG       ..  -8.5*SRGPG+17.1*RFGPG-21.9*SRNPG+6.5*CCGPG =g= 0 ;
StPressurPG   ..  18.2*SRGPG+2.55*RFGPG+ 6.5*SRNPG+ 6.9*CCGPG =l= 12.7*PG ;
StPressurRG   ..  18.2*SRGRG+2.55*RFGRG+ 6.5*SRNRG+ 6.9*CCGRG =l= 12.7*RG ;
SulfurDf      ..  0.283*SRNDF+0.351*CCFODF+0.525*SRDSDF+0.981*SRFODF =l= 0.5*DF ;
SulfurFO      ..  0.351*CCFOFO+0.525*SRDSFO+0.981*SRFOFO =l= 3*FO ;

AtDi  ..   CRUDE =l= 90000 ;
CtRe  ..   SRNRF =l= 25000  ;
CtCr  ..   SRDSCC+SRFOCC =l= 30000 ;

mineq1..   PG =g= 10000 ;
mineq2..   RG =g= 10000 ;
mineq3..   DF =g= 10000 ;
mineq4..   FO =g= 10000 ;
Main  ..   f =e= -33*CRUDE+3.5*(FGAD+FGCC+FGRF)+43*PG+41*RG+40*DF+12*FO - 0.98*CRUDE - 2.6*SRNRF - 2.2*(SRFOCC+SRDSCC);

Model transport /all/ ;

Solve transport using lp maximizing f ;
