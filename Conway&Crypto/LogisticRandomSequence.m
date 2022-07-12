function Sequence = LogisticRandomSequence(Length,Mu,X0)
%Generates random sequences of floats between 0 and 1 using logistic map
%with seed 3.9 < Mu < 4.0 and 0 < X0 < 1

Sequence = zeros(1,Length);
Sequence(1) = X0;
for i=1:Length-1
    Sequence(i+1) = Mu*Sequence(i)*(1-Sequence(i));
end

end
