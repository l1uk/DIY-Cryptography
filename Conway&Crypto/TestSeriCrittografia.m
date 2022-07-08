clc
close all
clear

RGBImage = imread('dogs.jpeg');
Image = rgb2gray(RGBImage);
Height = size(Image,1);
Width = size(Image,2);
Simulations = 1e3;
Iterations = 20; %Iterations of cellular automata
AdjacentPixelCorr = zeros(Simulations,3);
SamePixelCorr = zeros(Simulations,2);
KeySensitivity = zeros(Simulations,2);

for i=1:Simulations
    %% Encryption
Password = [3.9+0.1*rand(),rand()];
Mu = Password(1); %Logistic Map parameter: 3.9 < Mu < 4.0
X0 = Password(2); %Logistic Map initial value: 0 < X0 < 1
Sequence = LogisticRandomSequence(Height*Width,Mu,X0); 

LifeEncoded = Encoder(Image,Sequence,'Life',1,Iterations);
FredkinEncoded = Encoder(Image,Sequence,'Fredkin',1,Iterations);

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

PerturbedLifeEncoded = Encoder(Image,PerturbedSequence,'Life',Iterations,1);
PerturbedFredkinEncoded = Encoder(Image,PerturbedSequence,'Fredkin',Iterations,1);

KeySensitivity(i,:) = ...
    [corr2(LifeEncoded,PerturbedLifeEncoded),
    corr2(FredkinEncoded,PerturbedFredkinEncoded)];
disp(100*i/Simulations)

end

%% Istogrammi
figure(1)
hold on
histogram(AdjacentPixelCorr(:,1))
histogram(AdjacentPixelCorr(:,2))
histogram(AdjacentPixelCorr(:,3))
legend()
figure(2)
histogram(SamePixelCorr)
legend()
figure(3)
histogram(KeySensitivity)
legend()