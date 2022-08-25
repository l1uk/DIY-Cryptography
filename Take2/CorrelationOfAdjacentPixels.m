function Correlation = CorrelationOfAdjacentPixels(Image)

%Chooses 6000 random pairs of adjacent pixels and computes correlation of
%the pair

Width = size(Image,1);
Height = size(Image,2);
PixelCouplesSample = 6000;

%Generates first point coordinates
x1 = randi(Width,1,PixelCouplesSample);
y1 = randi(Height,1,PixelCouplesSample);
%Generates second point coordinates keeping track of periodic boundary
%conditions
x2 = mod(x1+1,Width+1)+(x1==Width); 
y2 = mod(y1+1,Height+1)+(y1==Height);

%Collects pixel values
FirstPixel = zeros(1,PixelCouplesSample);
SecondPixel = zeros(1,PixelCouplesSample);
for i = 1:PixelCouplesSample
    FirstPixel(i) = Image(x1(i),y1(i));
    SecondPixel(i) = Image(x2(i),y2(i));
end

Correlation = corr2(FirstPixel,SecondPixel);

end