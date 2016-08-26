%this is a script to read in the .dat files in this directory.
%There's only 7 files, so I'll use their literal names.

WL = linspace(200, 1000, 160);

[Number, r9, r14, r18, r23, r27, r32, r36, r41] = textread ("AgSpheresInH20_r=9-41nm_8steps_Lambda=0.2-1um_160steps_shape=30.dat" , "%d %f %f %f %f %f %f %f %f", "headerlines", 3);

Radii = linspace(9, 41, 8)

Volumes = 4.*pi().*Radii.*Radii.*Radii;
Areas = (4./3).*pi().*Radii.*Radii;

figure
hold on

plot(WL, r9, 'r', 'linewidth', 2);
plot(WL, r14, 'g', 'linewidth', 2);
plot(WL, r18, 'b', 'linewidth', 2);
plot(WL, r23, 'm', 'linewidth', 2);
plot(WL, r27, 'y', 'linewidth', 2);
plot(WL, r32, 'c', 'linewidth', 2);
plot(WL, r36, 'k', 'linewidth', 2);
plot(WL, r41, 'r', 'linewidth', 2);

Integral(1) = sum(r9(25:160));
Integral(2) = sum(r14(25:160));
Integral(3) = sum(r18(25:160));
Integral(4) = sum(r23(25:160));
Integral(5) = sum(r27(25:160));
Integral(6) = sum(r32(25:160));
Integral(7) = sum(r36(25:160));
Integral(8) = sum(r41(25:160));

figure
plot(Radii, Integral, 'rx', 'linewidth', 2);
figure
plot(Areas, Integral, 'g*', 'linewidth', 2);
figure
plot(Volumes, Integral, 'b0', 'linewidth', 2);
