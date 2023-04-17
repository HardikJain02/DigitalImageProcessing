clc;
clear;
close all;

% Define input image
img = [1 1 1
2 0 0
3 3 3];

% Dimensions of Input Image
[img_rows, img_cols, img_channels] = size(img);

% Convert color image to grayscale
if img_channels == 3
img = rgb2gray(img);
end

img = double(img);

% Calculate frequency of each pixel intensity in the input image
pixel_freq = zeros(1,8);
for i = 1:img_rows
for j = 1:img_cols
for k = 0:(2^(img_rows)-1)
if img(i,j)==k
pixel_freq(k+1)= pixel_freq(k+1)+1;
end
end
end
end

% Calculate the probability of each pixel value in the input image
pixel_prob = (1/(img_rows*img_cols))*pixel_freq;

% Calculate the entropy of the image
entropy = 0;
for m = 1:(2^(img_rows)-1)
if(pixel_prob(m)~=0)
entropy = entropy + (pixel_freq(m))(pixel_prob(m))(log2(pixel_prob(m)));
end
end
entropy = -(entropy);

% Calculate the average pixel intensity
sum_of_pixels = 0;
for S = 1:(img_rowsimg_cols)
sum_of_pixels = sum_of_pixels + img(S);
end
avg_pixel_intensity = sum_of_pixels/(img_rowsimg_cols);

% Calculate the median pixel value
img_sort = sort(img(:)); % Sort the array in ascending order
S = size(img_sort);
median_pixel_index = round(S(1)/2);
median_pixel_value = img_sort(median_pixel_index);

% Calculate the mode pixel value
% Intensity Levels -> 0 1 2 3 4 5 6 7
% Frequency -> 2 3 1 3 0 0 0 0
[max_frequency_value, max_frequency_index] = max(pixel_freq);
mode_pixel_value = (max_frequency_index-1);
