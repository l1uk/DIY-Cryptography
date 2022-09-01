clc
close all
clear

set(0,'defaultAxesFontSize',18)
set(0,'defaultTextInterpreter','latex')
set(0,'defaultLegendInterpreter','latex')
set(groot, 'defaultLineMarkerSize', 2)


%%

for im = ["data-dogs","data-scrivania"]
	i1r1 = load(im+filesep+"1Its1Resets.mat");
	i1r50 = load(im+filesep+"1Its50Resets.mat");
	i50r1 = load(im+filesep+"50Its1Resets.mat");
	i5r10 = load(im+filesep+"5Its10Resets.mat");
	i10r5 = load(im+filesep+"10Its5Resets.mat");
	i10r10 = load(im+filesep+"10Its10Resets.mat");
	grafici = strcat(fileparts(cd),"/Presentazione/grafici/Take2/"+im);

	%% Adjacent Pixel Correlation: Life

	f = 1;
	F(f) = figure;
	figure(F(f))
	f = f+1;

	t = tiledlayout(2,3);

	nexttile
	histogram(i1r1.AdjacentPixelCorr(:,2))
	title("Only Logistic Map")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i1r1.AdjacentPixelCorr(:,2)), std(i1r1.AdjacentPixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i1r50.AdjacentPixelCorr(:,2),'FaceColor','y')
	title("Only Logistic Map, 50 resets")
	leg = sprintf("$\\mu = %.5f, \\sigma = %.4f$",mean(i1r50.AdjacentPixelCorr(:,2)), std(i1r50.AdjacentPixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i50r1.AdjacentPixelCorr(:,2),'FaceColor','g')
	title("50 iterations, 1 reset")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i50r1.AdjacentPixelCorr(:,2)), std(i50r1.AdjacentPixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i10r5.AdjacentPixelCorr(:,2),'FaceColor','g')
	title("10 iterations, 5 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r5.AdjacentPixelCorr(:,2)), std(i10r5.AdjacentPixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i5r10.AdjacentPixelCorr(:,2),'FaceColor','g')
	title("5 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i5r10.AdjacentPixelCorr(:,2)), std(i5r10.AdjacentPixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i10r10.AdjacentPixelCorr(:,2),'FaceColor','g')
	title("10 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r10.AdjacentPixelCorr(:,2)), std(i10r10.AdjacentPixelCorr(:,2)));
	legend(leg)

	title(t,"Correlazione fra pixel adiacenti: Life","fontsize",24,"Interpreter","latex")

	%% Adjacent Pixel Correlation: Fredkin

	F(f) = figure;
	figure(F(f))
	f = f+1;

	t = tiledlayout(2,3);

	nexttile
	histogram(i1r1.AdjacentPixelCorr(:,3))
	title("Only Logistic Map")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i1r1.AdjacentPixelCorr(:,3)), std(i1r1.AdjacentPixelCorr(:,3)));
	legend(leg)

	nexttile
	histogram(i1r50.AdjacentPixelCorr(:,3),'FaceColor','y')
	title("Only Logistic Map, 50 resets")
	leg = sprintf("$\\mu = %.5f, \\sigma = %.4f$",mean(i1r50.AdjacentPixelCorr(:,3)), std(i1r50.AdjacentPixelCorr(:,3)));
	legend(leg)

	nexttile
	histogram(i50r1.AdjacentPixelCorr(:,3),'FaceColor','r')
	title("50 iterations, 1 reset")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i50r1.AdjacentPixelCorr(:,3)), std(i50r1.AdjacentPixelCorr(:,3)));
	legend(leg)

	nexttile
	histogram(i10r5.AdjacentPixelCorr(:,3),'FaceColor','r')
	title("10 iterations, 5 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r5.AdjacentPixelCorr(:,3)), std(i10r5.AdjacentPixelCorr(:,3)));
	legend(leg)

	nexttile
	histogram(i5r10.AdjacentPixelCorr(:,3),'FaceColor','r')
	title("5 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i5r10.AdjacentPixelCorr(:,3)), std(i5r10.AdjacentPixelCorr(:,3)));
	legend(leg)

	nexttile
	histogram(i10r10.AdjacentPixelCorr(:,3),'FaceColor','r')
	title("10 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r10.AdjacentPixelCorr(:,3)), std(i10r10.AdjacentPixelCorr(:,3)));
	legend(leg)

	title(t,"Correlazione fra pixel adiacenti: Fredkin","fontsize",24,"Interpreter","latex")

	%% Same Pixel Correlation: Life

	F(f) = figure;
	figure(F(f))
	f = f+1;

	t = tiledlayout(2,3);

	nexttile
	histogram(i1r1.SamePixelCorr(:,1))
	title("Only Logistic Map")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i1r1.SamePixelCorr(:,1)), std(i1r1.SamePixelCorr(:,1)));
	legend(leg)

	nexttile
	histogram(i1r50.SamePixelCorr(:,1),'FaceColor','y')
	title("Only Logistic Map, 50 resets")
	leg = sprintf("$\\mu = %.5f, \\sigma = %.4f$",mean(i1r50.SamePixelCorr(:,1)), std(i1r50.SamePixelCorr(:,1)));
	legend(leg)

	nexttile
	histogram(i50r1.SamePixelCorr(:,1),'FaceColor','g')
	title("50 iterations, 1 reset")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i50r1.SamePixelCorr(:,1)), std(i50r1.SamePixelCorr(:,1)));
	legend(leg)

	nexttile
	histogram(i10r5.SamePixelCorr(:,1),'FaceColor','g')
	title("10 iterations, 5 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r5.SamePixelCorr(:,1)), std(i10r5.SamePixelCorr(:,1)));
	legend(leg)

	nexttile
	histogram(i5r10.SamePixelCorr(:,1),'FaceColor','g')
	title("5 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i5r10.SamePixelCorr(:,1)), std(i5r10.SamePixelCorr(:,1)));
	legend(leg)

	nexttile
	histogram(i10r10.SamePixelCorr(:,1),'FaceColor','g')
	title("10 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r10.SamePixelCorr(:,1)), std(i10r10.SamePixelCorr(:,1)));
	legend(leg)

	title(t,"Correlazione di stesso pixel prima e dopo: Life","fontsize",24,"Interpreter","latex")

	%% Same Pixel Correlation: Fredkin

	F(f) = figure;
	figure(F(f))
	f = f+1;

	t = tiledlayout(2,3);

	nexttile
	histogram(i1r1.SamePixelCorr(:,2))
	title("Only Logistic Map")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i1r1.SamePixelCorr(:,2)), std(i1r1.SamePixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i1r50.SamePixelCorr(:,2),'FaceColor','y')
	title("Only Logistic Map, 50 resets")
	leg = sprintf("$\\mu = %.5f, \\sigma = %.4f$",mean(i1r50.SamePixelCorr(:,2)), std(i1r50.SamePixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i50r1.SamePixelCorr(:,2),'FaceColor','r')
	title("50 iterations, 1 reset")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i50r1.SamePixelCorr(:,2)), std(i50r1.SamePixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i10r5.SamePixelCorr(:,2),'FaceColor','r')
	title("10 iterations, 5 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r5.SamePixelCorr(:,2)), std(i10r5.SamePixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i5r10.SamePixelCorr(:,2),'FaceColor','r')
	title("5 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i5r10.SamePixelCorr(:,2)), std(i5r10.SamePixelCorr(:,2)));
	legend(leg)

	nexttile
	histogram(i10r10.SamePixelCorr(:,2),'FaceColor','r')
	title("10 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r10.SamePixelCorr(:,2)), std(i10r10.SamePixelCorr(:,2)));
	legend(leg)

	title(t,"Correlazione di stesso pixel prima e dopo: Fredkin","fontsize",24,"Interpreter","latex")

	%% Old Key Sensitivity: Life

	F(f) = figure;
	figure(F(f))
	f = f+1;

	t = tiledlayout(2,3);

	nexttile
	histogram(i1r1.OldKeySensitivity(:,1))
	title("Only Logistic Map")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i1r1.OldKeySensitivity(:,1)), std(i1r1.OldKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i1r50.OldKeySensitivity(:,1),'FaceColor','y')
	title("Only Logistic Map, 50 resets")
	leg = sprintf("$\\mu = %.5f, \\sigma = %.4f$",mean(i1r50.OldKeySensitivity(:,1)), std(i1r50.OldKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i50r1.OldKeySensitivity(:,1),'FaceColor','g')
	title("50 iterations, 1 reset")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i50r1.OldKeySensitivity(:,1)), std(i50r1.OldKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i10r5.OldKeySensitivity(:,1),'FaceColor','g')
	title("10 iterations, 5 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r5.OldKeySensitivity(:,1)), std(i10r5.OldKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i5r10.OldKeySensitivity(:,1),'FaceColor','g')
	title("5 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i5r10.OldKeySensitivity(:,1)), std(i5r10.OldKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i10r10.OldKeySensitivity(:,1),'FaceColor','g')
	title("10 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r10.OldKeySensitivity(:,1)), std(i10r10.OldKeySensitivity(:,1)));
	legend(leg)

	title(t,"Sensibilità alla chiave perturbando il seed: Life","fontsize",24,"Interpreter","latex")

	%% Old Key Sensitivity: Fredkin

	F(f) = figure;
	figure(F(f))
	f = f+1;

	t = tiledlayout(2,3);

	nexttile
	histogram(i1r1.OldKeySensitivity(:,2))
	title("Only Logistic Map")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i1r1.OldKeySensitivity(:,2)), std(i1r1.OldKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i1r50.OldKeySensitivity(:,2),'FaceColor','y')
	title("Only Logistic Map, 50 resets")
	leg = sprintf("$\\mu = %.5f, \\sigma = %.4f$",mean(i1r50.OldKeySensitivity(:,2)), std(i1r50.OldKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i50r1.OldKeySensitivity(:,2),'FaceColor','r')
	title("50 iterations, 1 reset")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i50r1.OldKeySensitivity(:,2)), std(i50r1.OldKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i10r5.OldKeySensitivity(:,2),'FaceColor','r')
	title("10 iterations, 5 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r5.OldKeySensitivity(:,2)), std(i10r5.OldKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i5r10.OldKeySensitivity(:,2),'FaceColor','r')
	title("5 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i5r10.OldKeySensitivity(:,2)), std(i5r10.OldKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i10r10.OldKeySensitivity(:,2),'FaceColor','r')
	title("10 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r10.OldKeySensitivity(:,2)), std(i10r10.OldKeySensitivity(:,2)));
	legend(leg)

	title(t,"Sensibilità alla chiave perturbando il seed: Fredkin","fontsize",24,"Interpreter","latex")

	%% New Key Sensitivity: Life

	F(f) = figure;
	figure(F(f))
	f = f+1;

	t = tiledlayout(2,3);

	nexttile
	histogram(i1r1.NewKeySensitivity(:,1))
	title("Only Logistic Map")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i1r1.NewKeySensitivity(:,1)), std(i1r1.NewKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i1r50.NewKeySensitivity(:,1),'FaceColor','y')
	title("Only Logistic Map, 50 resets")
	leg = sprintf("$\\mu = %.5f, \\sigma = %.4f$",mean(i1r50.NewKeySensitivity(:,1)), std(i1r50.NewKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i50r1.NewKeySensitivity(:,1),'FaceColor','g')
	title("50 iterations, 1 reset")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i50r1.NewKeySensitivity(:,1)), std(i50r1.NewKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i10r5.NewKeySensitivity(:,1),'FaceColor','g')
	title("10 iterations, 5 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r5.NewKeySensitivity(:,1)), std(i10r5.NewKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i5r10.NewKeySensitivity(:,1),'FaceColor','g')
	title("5 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i5r10.NewKeySensitivity(:,1)), std(i5r10.NewKeySensitivity(:,1)));
	legend(leg)

	nexttile
	histogram(i10r10.NewKeySensitivity(:,1),'FaceColor','g')
	title("10 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r10.NewKeySensitivity(:,1)), std(i10r10.NewKeySensitivity(:,1)));
	legend(leg)

	title(t,"Sensibilità alla chiave perturbando la board: Life","fontsize",24,"Interpreter","latex")

	%% New Key Sensitivity: Fredkin

	F(f) = figure;
	figure(F(f))
	f = f+1;

	t = tiledlayout(2,3);

	nexttile
	histogram(i1r1.NewKeySensitivity(:,2))
	title("Only Logistic Map")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i1r1.NewKeySensitivity(:,2)), std(i1r1.NewKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i1r50.NewKeySensitivity(:,2),'FaceColor','y')
	title("Only Logistic Map, 50 resets")
	leg = sprintf("$\\mu = %.5f, \\sigma = %.4f$",mean(i1r50.NewKeySensitivity(:,2)), std(i1r50.NewKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i50r1.NewKeySensitivity(:,2),'FaceColor','r')
	title("50 iterations, 1 reset")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i50r1.NewKeySensitivity(:,2)), std(i50r1.NewKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i10r5.NewKeySensitivity(:,2),'FaceColor','r')
	title("10 iterations, 5 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r5.NewKeySensitivity(:,2)), std(i10r5.NewKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i5r10.NewKeySensitivity(:,2),'FaceColor','r')
	title("5 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i5r10.NewKeySensitivity(:,2)), std(i5r10.NewKeySensitivity(:,2)));
	legend(leg)

	nexttile
	histogram(i10r10.NewKeySensitivity(:,2),'FaceColor','r')
	title("10 iterations, 10 resets")
	leg = sprintf("$\\mu = %.4f, \\sigma = %.4f$",mean(i10r10.NewKeySensitivity(:,2)), std(i10r10.NewKeySensitivity(:,2)));
	legend(leg)

	title(t,"Sensibilità alla chiave perturbando la board: Fredkin","fontsize",24,"Interpreter","latex")

	%% Salvataggio

	saveas(F(1),strcat(grafici,'/AdjacentPixelCorrLife.svg'))
	saveas(F(3),strcat(grafici,'/SamePixelCorrLife.svg'))
	saveas(F(5),strcat(grafici,'/OldKeySensitivity1Life.svg'))
	saveas(F(7),strcat(grafici,'/NewKeySensitivity1Life.svg'))
	saveas(F(2),strcat(grafici,'/AdjacentPixelCorrFredkin.svg'))
	saveas(F(4),strcat(grafici,'/SamePixelCorrFredkin.svg'))
	saveas(F(6),strcat(grafici,'/OldKeySensitivity2Fredkin.svg'))
	saveas(F(8),strcat(grafici,'/NewKeySensitivity2Fredkin.svg'))

    close all
end
