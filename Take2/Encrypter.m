function EncryptedImage = Encrypter(Image,Sequence,Rule,Iterations,Resets)

%Encrypts given image by permutating its pixel values according to
%evolution of Game of Life cellular Automata generated from given
%password via logistic map
%Generates board starting rounding pseudorandom sequence
Board = reshape(round(Sequence),size(Image));

for s = 1:Resets
    %Records History
    AlreadyOn = zeros(size(Image));
    NewOrder = [];
    for t = 1:Iterations
        NewlyOn = xor(Board,AlreadyOn) & Board;
        NewOrder = cat(1,NewOrder,find(NewlyOn));
        AlreadyOn = AlreadyOn | Board;
        Board = Evolve(Board,Rule);
    end
    NewOrder = cat(1,NewOrder,find(~AlreadyOn));

    PartiallyEncrypted = reshape(Image(NewOrder),size(Image))';
    EncryptedImage = reshape(PartiallyEncrypted(NewOrder),size(Image));
end
end
