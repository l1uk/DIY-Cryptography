clc
close all
clear

RGBImage = imread('dogs.jpeg');
Image = rgb2gray(RGBImage);
Height = size(Image,1);
Width = size(Image,2);
Simulations = 1e2;
AdjacentPixelCorr = zeros(Simulations,3);
SamePixelCorr = zeros(Simulations,2);
KeySensitivity = zeros(Simulations,2);

for Iterations=[1,10,100,1000]
    filename = sprintf("%dSimulations%dIterations.mat",Simulations,Iterations);
for i=1:Simulations
    %% Encryption
Password = [3.9+0.1*rand(),rand()];
Mu = Password(1); %Logistic Map parameter: 3.9 < Mu < 4.0
X0 = Password(2); %Logistic Map initial value: 0 < X0 < 1
Sequence = LogisticRandomSequence(Height*Width,Mu,X0);

LifeEncoded = Encrypter(Image,Sequence,'Life',Iterations);
FredkinEncoded = Encrypter(Image,Sequence,'Fredkin',Iterations);

%% Correlation tests

AdjacentPixelCorr(i,:) = ...
    [CorrelationOfAdjacentPixels(Image),...
    CorrelationOfAdjacentPixels(LifeEncoded),...
    CorrelationOfAdjacentPixels(FredkinEncoded)];

SamePixelCorr(i,:) = ...
    [corr2(Image,LifeEncoded),...
    corr2(Image,FredkinEncoded)];

%% Key sensitivity test

PerturbedSequence = Sequence;
ChangedIndex = randi(length(PerturbedSequence));
PerturbedSequence(ChangedIndex) = 1-PerturbedSequence(ChangedIndex);

PerturbedLifeEncoded = Encrypter(Image,PerturbedSequence,'Life',Iterations);
PerturbedFredkinEncoded = Encrypter(Image,PerturbedSequence,'Fredkin',Iterations);

KeySensitivity(i,:) = ...
    [corr2(LifeEncoded,PerturbedLifeEncoded),
    corr2(FredkinEncoded,PerturbedFredkinEncoded)];
disp(100*i/Simulations)
end
save(filename)
end


%%
figure(1)
hold on
histogram(AdjacentPixelCorr(:,1))
figure(2)
hold on
histogram(AdjacentPixelCorr(:,2))
figure(3)
hold on
histogram(AdjacentPixelCorr(:,3))

load("TestSeri.mat");
figure(1)
histogram(AdjacentPixelCorr(:,1))
figure(2)
histogram(AdjacentPixelCorr(:,2))
figure(3)
histogram(AdjacentPixelCorr(:,3))
