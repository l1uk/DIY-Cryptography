function EncryptedImage = Encrypter(Image,Sequence,Rule,Iterations)

%Encrypts given image by permutating its pixel values according to
%evolution of Game of Life cellular Automata generated from given 
%password via logistic map

%Generates board starting rounding pseudorandom sequence
Height = size(Image,1);
Width = size(Image,2);
Board = reshape(round(Sequence),Height,Width);

%Records History
CAHistory = zeros(Height,Width,Iterations);
for t = 1:Iterations
    CAHistory(:,:,t) = Board; 
    Board = Evolve(Board,Rule);
end

RowPermuted = Permute(Image,CAHistory); %Permutes rows
EncryptedImage = Permute(RowPermuted',CAHistory)'; %Permutes columns

end