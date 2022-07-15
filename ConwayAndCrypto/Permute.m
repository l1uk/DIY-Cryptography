function NewImage = Permute(OldImage,History)
%Permutes matrix based on recorded history of binary cellular automata
%First come the pixels corrensponding to alive cells at t=1
%Then for every t come pixel corresponding to cells initially dead but
%alive at time t
%At the end, all the rest

Order = []; %This will be the new order
Correction = ones(size(History(:,:,1))); %No corrections at t=1
for t=1:size(History,3)
    %Removes cells alive at previous times
    CurrentBoard = History(:,:,t).*Correction;
    %Keep track of indices of newly alive cells
    Order = cat(1,Order,find(CurrentBoard == 1)); 
    %Sets zeros in indices corresponding to cells already counted
    Correction(CurrentBoard==1) = 0;
end
Order = cat(1, Order, find(Correction==1));

%Permutes image using linear indices and then reshapes it to its correct
%dimensions
NewImage = reshape(OldImage(Order),size(OldImage));

end