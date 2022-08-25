clc
close all
clear

set(0,'defaultAxesFontSize',18)
set(0,'defaultTextInterpreter','latex')
set(0,'defaultLegendInterpreter','latex')
set(groot, 'defaultLineMarkerSize', 2)

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

load("data/KeySens1000Sim1It.mat")
KS{4} = KeySensitivity;
load("data/KeySens1000Sim10It.mat")
KS{5} = KeySensitivity;
load("data/KeySens1000Sim100It.mat")
KS{6} = KeySensitivity;
load("data/KeySens1000Sim1000It.mat")
KS{7} = KeySensitivity;

load("data/OldKeySens1000Sim1It.mat")
OKS{1} = KeySensitivity;
load("data/OldKeySens1000Sim10It.mat")
OKS{2} = KeySensitivity;
load("data/OldKeySens1000Sim100It.mat")
OKS{3} = KeySensitivity;

save('data/SimMetrics.mat','APC','SPC','KS')

%%

load("data/SimMetrics.mat")

%%
f = 1;
F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

t = tiledlayout(3,3);

nexttile([3,1])
histogram(APC{1}(:,1))
title("Original, no iteration")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(APC{1}(:,1)), std(APC{1}(:,1)));
legend(leg)

nexttile([1,2])
histogram(APC{1}(:,2),'FaceColor','y')
title("Only Logistic")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(APC{1}(:,2)), std(APC{1}(:,2)));
legend(leg)

% nexttile
% histogram(APC{2}(:,1))
% title("Original, 5 iterations")
% leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(APC{2}(:,1)), std(APC{2}(:,1)));
% legend(leg)

nexttile
histogram(APC{2}(:,2),'FaceColor','g')
title("Life, 5 iterations")
leg = sprintf("$\\mu = %.5f, \\sigma = %.3f$",mean(APC{2}(:,2)), std(APC{2}(:,2)));
legend(leg)

nexttile
histogram(APC{2}(:,3),'FaceColor','r')
title("Fredkin, 5 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(APC{2}(:,3)), std(APC{2}(:,3)));
legend(leg)

% nexttile
% histogram(APC{3}(:,1))
% title("Original, 20 iterations")
% leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(APC{3}(:,1)), std(APC{3}(:,1)));
% legend(leg)

nexttile
histogram(APC{3}(:,2),'FaceColor','g')
title("Life, 20 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(APC{3}(:,2)), std(APC{3}(:,2)));
legend(leg)

nexttile
histogram(APC{3}(:,3),'FaceColor','r')
title("Fredkin, 20 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(APC{3}(:,3)), std(APC{3}(:,3)));
legend(leg)

title(t,"Correlazione fra pixel adiacenti","fontsize",24,"Interpreter","latex")


%%

F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

t = tiledlayout(3,2);
nexttile([1,2])
histogram(SPC{1}(:,1),'FaceColor','y')
title("Only Logistics")
leg = sprintf("$\\mu = %.5f, \\sigma = %.3f$",mean(SPC{1}(:,1)), std(SPC{1}(:,1)));
legend(leg)

nexttile
histogram(SPC{2}(:,1),'FaceColor','g')
title("Life, 5 iterations")
leg = sprintf("$\\mu = %.5f, \\sigma = %.3f$",mean(SPC{2}(:,1)), std(SPC{2}(:,1)));
legend(leg)

nexttile
histogram(SPC{2}(:,2),'FaceColor','r')
title("Fredkin, 5 iterations")
leg = sprintf("$\\mu = %.5f, \\sigma = %.3f$",mean(SPC{2}(:,2)), std(SPC{2}(:,2)));
legend(leg)

nexttile
histogram(SPC{3}(:,1),'FaceColor','g')
title("Life, 20 iterations")
leg = sprintf("$\\mu = %.5f, \\sigma = %.3f$",mean(SPC{3}(:,1)), std(SPC{3}(:,1)));
legend(leg)

nexttile
histogram(SPC{3}(:,2),'FaceColor','r')
title("Fredkin, 20 iterations")
leg = sprintf("$\\mu = %.5f, \\sigma = %.3f$",mean(SPC{3}(:,2)), std(SPC{3}(:,2)));
legend(leg)

title(t,'Correlazione fra stesso pixel prima e dopo',"fontsize",24,"Interpreter","latex")

%%

F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

t = tiledlayout(2,3);

nexttile([2,1])
histogram(KS{1}(:,1),'FaceColor','y')
title("Only Logistics")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{1}(:,1)), std(KS{1}(:,1)));
legend(leg)

nexttile
histogram(KS{2}(:,1),'FaceColor','g')
title("Life, 5 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{2}(:,1)), std(KS{2}(:,1)));
legend(leg)

nexttile
histogram(KS{2}(:,2),'FaceColor','r')
title("Fredkin, 5 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{2}(:,2)), std(KS{2}(:,2)));
legend(leg)

nexttile
histogram(KS{3}(:,1),'FaceColor','g')
title("Life, 20 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{3}(:,1)), std(KS{3}(:,1)));
legend(leg)

nexttile
histogram(KS{3}(:,2),'FaceColor','r')
title("Fredkin, 20 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{3}(:,2)), std(KS{3}(:,2)));
legend(leg)

title(t,'Correlazione tra versioni criptate con board differenti di un pixel',"fontsize",24,"Interpreter","latex")

%%

F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

t = tiledlayout(3,3);

nexttile([3,1])
histogram(KS{4}(:,1),'FaceColor','y')
title("Only Logistics")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{4}(:,1)), std(KS{4}(:,1)));
legend(leg)

nexttile
histogram(KS{5}(:,1),'FaceColor','g')
title("Life, 10 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{5}(:,1)), std(KS{5}(:,1)));
legend(leg)

nexttile
histogram(KS{5}(:,2),'FaceColor','r')
title("Fredkin, 10 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{5}(:,2)), std(KS{5}(:,2)));
legend(leg)

nexttile
histogram(KS{6}(:,1),'FaceColor','g')
title("Life, 100 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{6}(:,1)), std(KS{6}(:,1)));
legend(leg)

nexttile
histogram(KS{6}(:,2),'FaceColor','r')
title("Fredkin, 100 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{6}(:,2)), std(KS{6}(:,2)));
legend(leg)

nexttile
histogram(KS{7}(:,1),'FaceColor','g')
title("Life, 1000 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{7}(:,1)), std(KS{7}(:,1)));
legend(leg)

nexttile
histogram(KS{7}(:,2),'FaceColor','r')
title("Fredkin, 1000 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(KS{7}(:,2)), std(KS{7}(:,2)));
legend(leg)

title(t,'Correlazione tra versioni criptate con board differenti di un pixel',"fontsize",24,"Interpreter","latex")

%%

F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

t = tiledlayout(2,3);

nexttile([2,1])
histogram(OKS{1}(:,1),'FaceColor','y')
title("Only Logistics")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(OKS{1}(:,1)), std(OKS{1}(:,1)));
legend(leg)

nexttile
histogram(OKS{2}(:,1),'FaceColor','g')
title("Life, 10 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(OKS{2}(:,1)), std(OKS{2}(:,1)));
legend(leg)

nexttile
histogram(OKS{2}(:,2),'FaceColor','r')
title("Fredkin, 10 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(OKS{2}(:,2)), std(OKS{2}(:,2)));
legend(leg)

nexttile
histogram(OKS{3}(:,1),'FaceColor','g')
title("Life, 100 iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(OKS{3}(:,1)), std(OKS{3}(:,1)));
legend(leg)

nexttile
histogram(OKS{3}(:,2),'FaceColor','r')
title("Fredkin, iterations")
leg = sprintf("$\\mu = %.3f, \\sigma = %.3f$",mean(OKS{3}(:,2)), std(OKS{3}(:,2)));
legend(leg)

title(t,'Correlazione tra versioni criptate con chiavi differenti di 1 bit',"fontsize",24,"Interpreter","latex")

%%

F(f) = figure('doublebuffer','off','visible','off');
figure(F(f))
f = f+1;

t = tiledlayout(2,3);

nexttile([2,1])
onlyGood = OKS{1}(:,1);
badPercent = numel(find(onlyGood==1))/numel(onlyGood);
onlyGood = onlyGood(abs(onlyGood)<0.01);
histogram(onlyGood,'FaceColor','y')
title("Only Logistics")
leg = sprintf("$\\mu = %f, \\sigma = %f$",mean(onlyGood), std(onlyGood));
legend(leg)

nexttile
onlyGood = OKS{2}(:,1);
badPercent = numel(find(onlyGood==1))/numel(onlyGood);
onlyGood = onlyGood(abs(onlyGood)<0.01);
histogram(onlyGood,'FaceColor','g')
title("Life, 10 iterations")
leg = sprintf("$\\mu = %f, \\sigma = %f$",mean(onlyGood), std(onlyGood));
legend(leg)

nexttile
onlyGood = OKS{2}(:,2);
badPercent = numel(find(onlyGood==1))/numel(onlyGood);
onlyGood = onlyGood(abs(onlyGood)<0.01);
histogram(onlyGood,'FaceColor','r')
title("Fredkin, 10 iterations")
leg = sprintf("$\\mu = %f, \\sigma = %f$",mean(onlyGood), std(onlyGood));
legend(leg)

nexttile
onlyGood = OKS{3}(:,1);
badPercent = numel(find(onlyGood==1))/numel(onlyGood);
onlyGood = onlyGood(abs(onlyGood)<0.01);
histogram(onlyGood,'FaceColor','g')
title("Life, 100 iterations")
leg = sprintf("$\\mu = %f, \\sigma = %f$",mean(onlyGood), std(onlyGood));
legend(leg)

nexttile
onlyGood = OKS{3}(:,2);
badPercent = numel(find(onlyGood==1))/numel(onlyGood);
onlyGood = onlyGood(abs(onlyGood)<0.01);
histogram(onlyGood,'FaceColor','r')
title("Fredkin, 100 iterations")
leg = sprintf("$\\mu = %f, \\sigma = %f$",mean(onlyGood), std(onlyGood));
legend(leg)

title(t,'Correlazione tra versioni criptate con chiavi differenti di 1 bit, correzione',"fontsize",24,"Interpreter","latex")

%%

saveas(F(1),strcat(grafici,'/AdjacentPixelCorr.svg'))
saveas(F(2),strcat(grafici,'/SamePixelCorr.svg'))
saveas(F(3),strcat(grafici,'/OldKeySensitivity1.svg'))
saveas(F(4),strcat(grafici,'/OldKeySensitivity2.svg'))
saveas(F(5),strcat(grafici,'/NewKeySensitivity1.svg'))
saveas(F(6),strcat(grafici,'/NewKeySensitivity2.svg'))
