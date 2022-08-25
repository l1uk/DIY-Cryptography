clc
clear
close all

j = 1;
for i=["1","10","100"]
    load("data/OldKeySens1000Sim"+i+"It.mat")
    LifeSens = KeySensitivity(:,1);
    FredSens = KeySensitivity(:,2);
    noIncidentsLife = LifeSens(abs(LifeSens) < 0.01);
    noIncidentsFred = FredSens(abs(FredSens) < 0.01);
    figure(j)
    tiledlayout(1,2)
    nexttile
    histogram(noIncidentsFred)
    fail = sprintf("Correlazione 1 nel %f dei casi\n" + ...
        "std = %f", numel(find(LifeSens==1))/numel(LifeSens), ...
        std(LifeSens));
    legend(fail)
    nexttile
    histogram(noIncidentsFred)
    fail = sprintf("Correlazione 1 nel %f dei casi\n" + ...
        "std = %f", numel(find(FredSens==1))/numel(FredSens), ...
        std(FredSens));
    legend(fail)
    title(i)
    j = j+1;
end
