%this is a script to read in the .dat files in this directory.
%There's only 7 files, so I'll use their literal names.

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Minus2.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLMinus2 = WL;
QextMinus2 = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Minus1.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLMinus1 = WL;
QextMinus1 = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Minus0.5.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLMinus0p5 = WL;
QextMinus0p5 = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Avg.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLAvg = WL;
QextAvg = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Plus0.5.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLPlus0p5 = WL;
QextPlus0p5 = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Plus1.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLPlus1 = WL;
QextPlus1 = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Plus2.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLPlus2 = WL;
QextPlus2 = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Plus1_Plus1.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLPlus1Plus1 = WL;
QextPlus1Plus1 = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Plus1_Minus1.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLPlus1Minus1 = WL;
QextPlus1Minus1 = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Minus1_Minus1.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLMinus1Minus1 = WL;
QextMinus1Minus1 = Qext;

[aeff, WL, Qext, Qabs, Qsca, g1, cos2, Qbk, Nsca] = textread ("Minus1_Plus1.dat" , "%f %f %f %f %f %f %f %f %d", "headerlines", 14);
WLMinus1Plus1 = WL;
QextMinus1Plus1 = Qext;
