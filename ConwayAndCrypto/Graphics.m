clc
close all
clear

grafici = strcat(fileparts(cd),'/Presentazione/grafici');
%%

load("data/10000Simulations1Iterations.mat")
APC{1} = AdjacentPixelCorr;
SPC{1} = SamePixelCorr;
KS{1} = KeySensitivity;
load("data/10000Simulations5Iterations.mat")
APC{2} = AdjacentPixelCorr;
SPC{2} = SamePixelCorr;
KS{2} = KeySensitivity;
load("data/10000Simulations20Iterations.mat")
APC{3} = AdjacentPixelCorr;
SPC{3} = SamePixelCorr;
KS{3} = KeySensitivity;

save('data/10000metrics.mat','APC','SPC','KS')

%%

load("data/10000metrics.mat")

%%
f = 1;

figure(f)
f = f+1;
title("Correlazione tra pixel adiacenti")
subplot(3,3,1)
histogram(APC{1}(:,1))
legend({"Original, no iteration"},"fontsize",12,"interpreter",'latex')

subplot(3,3,2)
histogram(APC{1}(:,2))
legend({"Life, no iteration"},"fontsize",12,"interpreter",'latex')

subplot(3,3,3)
histogram(APC{1}(:,3))
legend({"Fredkin, no iteration"},"fontsize",12,"interpreter",'latex')

subplot(3,3,4)
histogram(APC{2}(:,1))
legend({"Original, 5 iterations"},"fontsize",12,"interpreter",'latex')

subplot(3,3,5)
histogram(APC{2}(:,2))
legend({"Life, 5 iterations"},"fontsize",12,"interpreter",'latex')

subplot(3,3,6)
histogram(APC{2}(:,3))
legend({"Fredkin, 5 iterations"},"fontsize",12,"interpreter",'latex')

subplot(3,3,7)
histogram(APC{3}(:,1))
legend({"Original, 20 iterations"},"fontsize",12,"interpreter",'latex')

subplot(3,3,8)
histogram(APC{3}(:,2))
legend({"Life, 20 iterations"},"fontsize",12,"interpreter",'latex')

subplot(3,3,9)
histogram(APC{3}(:,3))
legend({"Fredkin, 20 iterations"},"fontsize",12,"interpreter",'latex')

%%

figure(f)
f = f+1;

subplot(3,2,1)
histogram(SPC{1}(:,1))
legend({"Life, no iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,2)
histogram(SPC{1}(:,2))
legend({"Fredkin, no iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,3)
histogram(SPC{2}(:,1))
legend({"Life, 5 iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,4)
histogram(SPC{2}(:,2))
legend({"Fredkin, 5 iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,5)
histogram(SPC{3}(:,1))
legend({"Life, 20 iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,6)
histogram(SPC{3}(:,2))
legend({"Fredkin, 20 iterations"}, "fontsize", 12, "interpreter", "latex")

%%

figure(f)
f = f+1;

subplot(3,2,1)
histogram(KS{1}(:,1))
legend({"Life, no iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,2)
histogram(KS{1}(:,2))
legend({"Fredkin, no iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,3)
histogram(KS{2}(:,1))
legend({"Life, 5 iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,4)
histogram(KS{2}(:,2))
legend({"Fredkin, 5 iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,5)
histogram(KS{3}(:,1))
legend({"Life, 20 iterations"}, "fontsize", 12, "interpreter", "latex")

subplot(3,2,6)
histogram(KS{3}(:,2))
legend({"Fredkin, 20 iterations"}, "fontsize", 12, "interpreter", "latex")

%%

saveas(figure(1),strcat(grafici,'/AdjacentPixelCorr.png'))
saveas(figure(2),strcat(grafici,'/SamePixelCorr.png'))
saveas(figure(3),strcat(grafici,'/KeySensitivity.png'))
