%Exercise 1 SET 1
clear all;
close all;

f=imread('cameraman.tif');%Loading the image(f as 2D ARRAY)
figure;%Window for displaying the image

imagesc(f);%Displaying the image 
title('ORIGINAL_f image');
colormap(gray);

F=dct2(f);%Getting the DCT of the input f image(Cameraman)

[rows columns]=size(f);%Getting the number of rows and columns for the input image f

%For abs(F(i,j))<5 
for i=1:rows
  for j=1:columns
    if (abs(F(i,j))<5)%For the third question if abs of current F(i,j) is <5 then current F(i,j) is set to zero
      F(i,j)=0;
    
    else
      continue;
    
    endif
    
  endfor
  
endfor

updated_F=uint8(idct2(F));

figure;
imagesc(updated_F);
title('UPDATED_F image for F(i,j)<5');
colormap(gray);

%Calculating PSNR for the third question
temp_MSE=0;%Initializing temp_MSE to zero to calculate the double sum

for i=1:rows
  for j=1:columns
    temp_MSE=temp_MSE+double((f(i,j)-updated_F(i,j))^2);%Updating temp_MSE for every pixel
  endfor

endfor

FINAL_MSE=temp_MSE/(rows*columns);
fprintf("MSE FOR F(i,j)<5 is %f\n",FINAL_MSE);

PSNR_1=10*log10((255^2)/FINAL_MSE);
fprintf("PSNR FOR F(i,j)<5 is %f\n",PSNR_1);

%Calculating the number of zeros
zero_counter1=0;
for i=1:rows
  for j=1:columns
    if(F(i,j)==0)
      zero_counter1=zero_counter1+1;
    else 
      continue;
    endif
    
  endfor
  
endfor

fprintf("NUMBER OF ZERO'S FOR F(i,j)<5 is %d\n\n\n",zero_counter1);
%#################################################################################################
%4th question for F(i,j)<10

for i=1:rows
  for j=1:columns
    if (abs(F(i,j))<10)%For the fourth question if abs of current F(i,j) is <10 then current F(i,j) is set to zero
      F(i,j)=0;
    
    else
      continue;
    
    endif
    
  endfor
  
endfor

updated_F=uint8(idct2(F));


%Calculating PSNR for the third question
temp_MSE2=0;%Initializing temp_MSE to zero to calculate the double sum

for i=1:rows
  for j=1:columns
    temp_MSE2=temp_MSE2+double((f(i,j)-updated_F(i,j))^2);%Updating temp_MSE2 for every pixel
  endfor

endfor

FINAL_MSE2=temp_MSE2/(rows*columns);
fprintf("MSE FOR F(i,j)<10 is %f\n",FINAL_MSE2);

PSNR_2=10*log10((255^2)/FINAL_MSE2);
fprintf("PSNR FOR F(i,j)<10 is %f\n",PSNR_2);

%Calculating the number of zeros
zero_counter2=0;
for i=1:rows
  for j=1:columns
    if(F(i,j)==0)
      zero_counter2=zero_counter2+1;
    else 
      continue;
    endif
    
  endfor
  
endfor

fprintf("NUMBER OF ZERO'S FOR F(i,j)<10 is %d\n\n\n",zero_counter2);

figure;
imagesc(updated_F);
title('UPDATED_F image for F(i,j)<10');
colormap(gray);


%#################################################################################################
%4th question for F(i,j)<15

for i=1:rows
  for j=1:columns
    if (abs(F(i,j))<15)%For the fourth question if abs of current F(i,j) is <15 then current F(i,j) is set to zero
      F(i,j)=0;
    
    else
      continue;
    
    endif
    
  endfor
  
endfor

updated_F=uint8(idct2(F));


%Calculating PSNR for the third question
temp_MSE3=0;%Initializing temp_MSE to zero to calculate the double sum

for i=1:rows
  for j=1:columns
    temp_MSE3=temp_MSE3+double((f(i,j)-updated_F(i,j))^2);%Updating temp_MSE3 for every pixel
  endfor

endfor

FINAL_MSE3=temp_MSE3/(rows*columns);
fprintf("MSE FOR F(i,j)<15 is %f\n",FINAL_MSE3);

PSNR_3=10*log10((255^2)/FINAL_MSE3);
fprintf("PSNR FOR F(i,j)<15 is %f\n",PSNR_3);

%Calculating the number of zeros
zero_counter3=0;
for i=1:rows
  for j=1:columns
    if(F(i,j)==0)
      zero_counter3=zero_counter3+1;
    else 
      continue;
    endif
    
  endfor
  
endfor

fprintf("NUMBER OF ZERO'S FOR F(i,j)<15 is %d\n\n\n",zero_counter3);


figure;
imagesc(updated_F);
title('UPDATED_F image for F(i,j)<15');
colormap(gray);









