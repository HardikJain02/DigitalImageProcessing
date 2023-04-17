clc; 
clear; 
close all;

% First, we will convert image into a GreyScale Image.
I = imread('hardik.png');
Ig = rgb2gray(I);

% Bit Plane Slicing on the GReyscale Image
[row, col, layers] = size(Ig);
if (layers==3)
    error('Input Image should be a Greyscale Image in order to perform Bit Plane Slicing');
else
    [A1,A2,A3,A4,A5,A6,A7,A8] = BitPlaneSlicing(Ig);
end

%Below will be all the Bit planes as Images

%Bit Plane 1(Least Significant Bit)
subplot(3,3,1);
imshow(A1);
title('I0');

%Bit Plane 2
subplot(3,3,2);
imshow(A2);
title('I1');

%Bit Plane 3
subplot(3,3,3);
imshow(A3);
title('I2');

%Bit Plane 4
subplot(3,3,4);
imshow(A4);
title('I3');

%Bit Plane 5
subplot(3,3,5);
imshow(A5);
title('I4');

%Bit Plane 6
subplot(3,3,6);
imshow(A6);
title('I5');

%Bit Plane 7
subplot(3,3,7);
imshow(A7);
title('I6');

%Bit Plane 8(MSB)
subplot(3,3,8);
imshow(A8);
title('I7');
 
% We will make the Least Significant Bit Plane as Zero and Then Combine all the Bit Planes. Display the Reconstructed Image.
A1 = zeros(row,col);
Updated_Planes = A1*(2^0) + A2*(2^1) + A3*(2^2) + A4*(2^3) + A5*(2^4) + A6*(2^5) + A7*(2^6) + A8*(2^7);
Ir = uint8(Updated_Planes);
subplot(3,3,9);
imshow(Ir);
title('Reconstructed Image');
 
% Bit Plane Slicer (Function) using bitget command
function [A1,A2,A3,A4,A5,A6,A7,A8] = BitPlaneSlicing(Ig)
[row, col] = size(Ig);
B=zeros(row,col,8);
for k = 1:8
    for i = 1:row
        for j = 1:col
            B(i,j,k) = bitget(Ig(i,j),k); 
        end
    end
end

A1 = B(:,:,1);
A2 = B(:,:,2);
A3 = B(:,:,3);
A4 = B(:,:,4);
A5 = B(:,:,5);
A6 = B(:,:,6);
A7 = B(:,:,7);
A8 = B(:,:,8);
end
