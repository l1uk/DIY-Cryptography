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

load("data/KeySens100Sim50It.mat")
KS{4} = KeySensitivity;
load("data/KeySens100Sim100It.mat")
KS{5} = KeySensitivity;
load("data/KeySens100Sim150It.mat")
KS{6} = KeySensitivity;
load("data/KeySens100Sim500It.mat")
KS{7} = KeySensitivity;

save('data/SimMetrics.mat','APC','SPC','KS')

%%

load("data/SimMetrics.mat")

%%
f = 1;
F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

subplot(3,3,1)
histogram(APC{1}(:,1))
title({"Original, no iteration"},"fontsize", 24, "interpreter",'latex')

subplot(3,3,2)
histogram(APC{1}(:,2))
title({"Life, no iteration"},"fontsize", 24, "interpreter",'latex')

subplot(3,3,3)
histogram(APC{1}(:,3))
title({"Fredkin, no iteration"},"fontsize", 24, "interpreter",'latex')

subplot(3,3,4)
histogram(APC{2}(:,1))
title({"Original, 5 iterations"},"fontsize", 24, "interpreter",'latex')

subplot(3,3,5)
histogram(APC{2}(:,2))
title({"Life, 5 iterations"},"fontsize", 24, "interpreter",'latex')

subplot(3,3,6)
histogram(APC{2}(:,3))
title({"Fredkin, 5 iterations"},"fontsize", 24, "interpreter",'latex')

subplot(3,3,7)
histogram(APC{3}(:,1))
title({"Original, 20 iterations"},"fontsize", 24, "interpreter",'latex')

subplot(3,3,8)
histogram(APC{3}(:,2))
title({"Life, 20 iterations"},"fontsize", 24, "interpreter",'latex')

subplot(3,3,9)
histogram(APC{3}(:,3))
title({"Fredkin, 20 iterations"},"fontsize", 24, "interpreter",'latex')

suptitle("Correlazione fra pixel adiacenti")

%%

F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

subplot(3,2,1)
histogram(SPC{1}(:,1))
title({"Life, no iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,2)
histogram(SPC{1}(:,2))
title({"Fredkin, no iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,3)
histogram(SPC{2}(:,1))
title({"Life, 5 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,4)
histogram(SPC{2}(:,2))
title({"Fredkin, 5 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,5)
histogram(SPC{3}(:,1))
title({"Life, 20 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,6)
histogram(SPC{3}(:,2))
title({"Fredkin, 20 iterations"}, "fontsize", 24, "interpreter", "latex")

suptitle("Correlazione fra stesso pixel prima e dopo")

%%

F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

subplot(3,2,1)
histogram(KS{1}(:,1))
title({"Life, no iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,2)
histogram(KS{1}(:,2))
title({"Fredkin, no iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,3)
histogram(KS{2}(:,1))
title({"Life, 5 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,4)
histogram(KS{2}(:,2))
title({"Fredkin, 5 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,5)
histogram(KS{3}(:,1))
title({"Life, 20 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,6)
histogram(KS{3}(:,2))
title({"Fredkin, 20 iterations"}, "fontsize", 24, "interpreter", "latex")

suptitle("Correlazione tra versioni criptate con chiavi differenti di eps")

%%

F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

subplot(3,2,1)
histogram(KS{4}(:,1))
title({"Life, 50 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,2)
histogram(KS{4}(:,2))
title({"Fredkin, 50 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,3)
histogram(KS{5}(:,1))
title({"Life, 100 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,4)
histogram(KS{5}(:,2))
title({"Fredkin, 100 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,5)
histogram(KS{7}(:,1))
title({"Life, 500 iterations"}, "fontsize", 24, "interpreter", "latex")

subplot(3,2,6)
histogram(KS{7}(:,2))
title({"Fredkin, 500 iterations"}, "fontsize", 24, "interpreter", "latex")

suptitle("Correlazione tra versioni criptate con chiavi differenti di eps")

%%

saveas(F(1),strcat(grafici,'/AdjacentPixelCorr.png'))
saveas(F(2),strcat(grafici,'/SamePixelCorr.png'))
saveas(F(3),strcat(grafici,'/KeySensitivityFew.png'))
saveas(F(4),strcat(grafici,'/KeySensitivityMore.png'))
