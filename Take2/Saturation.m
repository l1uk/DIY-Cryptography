clc
close all
clear

RGBImage = imread('dogs.jpeg');
Image = rgb2gray(RGBImage);
Height = size(Image,1);
Width = size(Image,2);

Simulations = 1e2;
Iterations = 1e2;
LifeSaturation = zeros(Simulations,Iterations);
FredSaturation = zeros(Simulations,Iterations);

for n = 1:Simulations
	Password = [3.9+0.1*rand(),rand()];
	Mu = Password(1); %Logistic Map parameter: 3.9 < Mu < 4.0
	X0 = Password(2); %Logistic Map initial value: 0 < X0 < 1
	Sequence = LogisticRandomSequence(Height*Width,Mu,X0);
	LifeBoard = reshape(round(Sequence),size(Image));
	FredBoard = reshape(round(Sequence),size(Image));
    	LifeAlreadyOn = zeros(size(Image));
    	FredAlreadyOn = zeros(size(Image));
	for t = 1:Iterations
		LifeAlreadyOn = LifeAlreadyOn | LifeBoard;
		FredAlreadyOn = FredAlreadyOn | FredBoard;
        	LifeBoard = Evolve(LifeBoard,"Life");
        	FredBoard = Evolve(FredBoard,"Fredkin");
		LifeSaturation(n,t) = sum(LifeAlreadyOn,'all');
		FredSaturation(n,t) = sum(FredAlreadyOn,'all');
        fprintf("Simulations %.1f%%, Iterations %.1f%%\n",...
            n/Simulations*100,t/Iterations*100)
	end
end
%%
LifeSaturation = LifeSaturation/(Height*Width);
FredSaturation = FredSaturation/(Height*Width);
figure(1)
t = tiledlayout(2,2);
nexttile
errorbar(mean(LifeSaturation), std(LifeSaturation))
xlabel("t")
ylabel("y")
title("Life")
nexttile
errorbar(mean(FredSaturation), std(FredSaturation))
xlabel("t")
ylabel("y")
title("Fredkin")
nexttile
errorbar(log(1-mean(LifeSaturation)), std(LifeSaturation))
xlabel("t")
ylabel("log(1-y)")
title("Life")
nexttile
errorbar(log(1-mean(FredSaturation)), std(FredSaturation))
xlabel("t")
ylabel("log(1-y)")
title("Fredkin")

title(t,"Percentuale di celle attivate almeno una volta al tempo t")
