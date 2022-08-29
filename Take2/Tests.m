clc
close all
clear

RGBImage = imread('dogs.jpeg');
Image = rgb2gray(RGBImage);
Height = size(Image,1);
Width = size(Image,2);
Simulations = 1e3;
AdjacentPixelCorr = zeros(Simulations,3);
SamePixelCorr = zeros(Simulations,2);
OldKeySensitivity = zeros(Simulations,2);
NewKeySensitivity = zeros(Simulations,2);
pars = [... % Iterations, Resets
    10, 5
    5, 10
    1, 50
    50, 1
    10, 10];
for j=1:size(pars,1)
    Iterations = pars(j,1);
    Resets = pars(j,2);
    filename = sprintf("%dIts%dResets.mat",Iterations,Resets);
    for i=1:Simulations
        %% Encryption
        Password = [3.9+0.1*rand(),rand()];
        Mu = Password(1); %Logistic Map parameter: 3.9 < Mu < 4.0
        X0 = Password(2); %Logistic Map initial value: 0 < X0 < 1
        Sequence = LogisticRandomSequence(Height*Width,Mu,X0);

        LifeEncoded = Encrypter(Image,Sequence,'Life',Iterations,Resets);
        FredkinEncoded = Encrypter(Image,Sequence,'Fredkin',Iterations,Resets);

        %% Correlation tests

        AdjacentPixelCorr(i,:) = ...
            [CorrelationOfAdjacentPixels(Image),...
            CorrelationOfAdjacentPixels(LifeEncoded),...
            CorrelationOfAdjacentPixels(FredkinEncoded)];

        SamePixelCorr(i,:) = ...
            [corr2(Image,LifeEncoded),...
            corr2(Image,FredkinEncoded)];

        %% Old Key sensitivity test
        e = 1e-9;
        PerturbedSequence = LogisticRandomSequence(Height*Width,Mu+e,X0+e);

        PerturbedLifeEncoded = Encrypter(Image,PerturbedSequence,'Life',...
            Iterations,Resets);
        PerturbedFredkinEncoded = Encrypter(Image,PerturbedSequence,'Fredkin',...
            Iterations,Resets);

        OldKeySensitivity(i,:) = ...
            [corr2(LifeEncoded,PerturbedLifeEncoded),...
            corr2(FredkinEncoded,PerturbedFredkinEncoded)];

        %% New Key sensitivity test

        PerturbedSequence = Sequence;
        ChangedIndex = randi(length(PerturbedSequence));
        PerturbedSequence(ChangedIndex) = 1-PerturbedSequence(ChangedIndex);

        PerturbedLifeEncoded = Encrypter(Image,PerturbedSequence,'Life',...
            Iterations,Resets);
        PerturbedFredkinEncoded = Encrypter(Image,PerturbedSequence,'Fredkin',...
            Iterations,Resets);

        NewKeySensitivity(i,:) = ...
            [corr2(LifeEncoded,PerturbedLifeEncoded),
            corr2(FredkinEncoded,PerturbedFredkinEncoded)];

        disp(100*i/Simulations)
    end
    save(strcat('data/',filename),...
        AdjacentPixelCorr, SamePixelCorr,...
        OldKeySensitivity,NewKeySensitivity)
end
