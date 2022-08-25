clc
close all
clear

RGBImage = imread('dogs.jpeg');
Image = rgb2gray(RGBImage);
Height = size(Image,1);
Width = size(Image,2);
Simulations = 1e3;
KeySensitivity = zeros(Simulations,2);
tic 
for Iterations=[1000]
    filename = sprintf("KeySens%dSim%dIt.mat",Simulations,Iterations);
for i=1:Simulations
    %% Encryption
Password = [3.9+0.1*rand(),rand()];
Mu = Password(1); %Logistic Map parameter: 3.9 < Mu < 4.0
X0 = Password(2); %Logistic Map initial value: 0 < X0 < 1
Sequence = LogisticRandomSequence(Height*Width,Mu,X0);

LifeEncoded = Encrypter(Image,Sequence,'Life',Iterations);
FredkinEncoded = Encrypter(Image,Sequence,'Fredkin',Iterations);

%% Key sensitivity test

PerturbedSequence = Sequence;
ChangedIndex = randi(length(PerturbedSequence));
PerturbedSequence(ChangedIndex) = 1-PerturbedSequence(ChangedIndex);

PerturbedLifeEncoded = Encrypter(Image,PerturbedSequence,'Life',Iterations);
PerturbedFredkinEncoded = Encrypter(Image,PerturbedSequence,'Fredkin',Iterations);

KeySensitivity(i,:) = ...
    [corr2(LifeEncoded,PerturbedLifeEncoded),...
    corr2(FredkinEncoded,PerturbedFredkinEncoded)];
disp(100*i/Simulations)
end
save(strcat('data/',filename))
end
toc