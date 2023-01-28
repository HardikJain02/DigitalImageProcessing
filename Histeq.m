clc
clear all
close all
I=imread('hardik.jpg');   %taking image as input

[row, column, layer]=size(I)    % we will get the values of row, column and color

% as we know the histogram eqalizer process needs the image to be gray. If our image has more than 1 layer then code will change it into gray image and if there is only 1 layer then code will continue

if layer==1
   
    count=zeros(1,256);  % count array stores the count of pixel value
    for i=1:row
        for j=1:column
            count(I(i,j)+1)=count(I(i,j)+1)+1;
        end
    end
    countmin=0;   % minimum count using for loop
    for i=1:255
        if count(1,i)==0
            continue
        elseif count(i)<count(i+1)
                countmin=count(i);
        end
    end     
            
  
    histogram=uint8(zeros(row,column)); %this is grayscale image pixel value
    sum=0;
    for i=1:256     % adding count value in previous values
        
        if count(1,i)==0
            continue        
        else
            sum=count(1,i)+sum;
            count(1,i)=sum;
        end
    end
    
    for i=1:row          % we are using this formula for histogram pixel value
        for j=1:column
            histogram(i,j)=(count(I(i,j)+1)-countmin)*255/((row*column)-countmin);
            
        end
    end
    
    
    %final histogram image
    
    
    imshow(uint8(histogram))
     
   
          
    %finding color image histogram
    
else
    I=rgb2gray(I);
    count=zeros(1,256);

    % same procedure will be repeated
    
    for i=1:row
        for j=1:column
            count(I(i,j)+1)=count(I(i,j)+1)+1;
        end
    end
    countmin=0;
    for i=1:255
        if count(1,i)==0
            continue
        elseif count(i)<count(i+1)
                countmin=count(i);
        end
    end     
            
  
    histogram=uint8(zeros(row,column));
    sum=0;
    for i=1:256
        
        if count(1,i)==0
            continue
        else
            sum=count(1,i)+sum;
            count(1,i)=sum;
        end
    end
    
    for i=1:row
        for j=1:column
            histogram(i,j)=(count(I(i,j)+1)-countmin)*255/((row*column)-countmin);
            
        end
    end
    
    imshow(uint8(histogram))
end

                    
   
