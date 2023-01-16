clc
clear all;
close all;

%RGB Image

Image = imread('file path'); 
imshow(I);
figure();

%Getting GreyScaleImage
Ir = Image(:,:,1);
imshow(Ir);
figure();

%Below will show the red-colored components 

IR = Image;
IR(:,:,2) = 0;
IR(:,:,3) = 0;
imshow(IR);
figure();

%Below will show the green-colored components 
IG = Image;
IG(:,:,1) = 0;
IG(:,:,3) = 0;
imshow(IG);
figure();

%Below will show the blue-colored components 
IB = Image;
IB(:,:,1) = 0;
IB(:,:,2) = 0;
imshow(IB);
figure();

%Below is the calculation of the average RGB values

IRavrg = (sum(sum(IR)))./((size(IR,1)).*(size(IR,2)));
imshow(IRavrg);
figure();
IGavrg = (sum(sum(IG)))./((size(IG,1)).*(size(IG,2)));
imshow(IGavrg);
figure();
IBavrg = (sum(sum(IB)))./((size(IB,1)).*(size(IB,2)));
imshow(IBavrg);
figure();
