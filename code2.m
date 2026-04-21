%Exercise 2 SET 1
clear all;
close all;

f=imread('cameraman.tif');%f is represented as a 2D array first question
entropy(f);%Calling entropy function second question

fprintf("ENTROPY OF ORIGINAL IMAGE f is %f\n",entropy(f));

[rows columns]=size(f);%Getting the rows and columns from f image

f_blocks=zeros(rows,columns);%Initializing an array for breaking the blocks image

Q1=[[16 11 10 16 24 40 51 61];[12 12 14 19 26 58 60 55];
     [14 13 16 24 40 57 69 56];[14 17 22 29 51 87 80 62];
     [18 22 37 56 68 109 103 77];[24 35 55 64 81 104 113 92];
     [49 64 78 87 103 121 120 101];[72 92 95 98 112 100 103 99]];

%Breaking the f image in 8x8 blocks while also calculating dct2 for each block
for i=1:8:rows
  for j=1:8:columns
    f_blocks(i:(i+7),j:(j+7))=dct2(f(i:(i+7),j:(j+7)));
    
  endfor
endfor

F_blocks=zeros(rows,columns);%Initializing an array for breaking the blocks to zeros

for i=1:8:rows
  for j=1:8:columns
    F_blocks(i:(i+7),j:(j+7))=round(f_blocks(i:(i+7),j:(j+7))./Q1);
    
  endfor
endfor


x=entropy(abs(F_blocks));
fprintf("ENTROPY OF abs(F_blocks(i,j)) is %f\n",x);

invert_F_blocks=zeros(rows,columns);

for i=1:8:rows
  for j=1:8:columns
    invert_F_blocks(i:(i+7),j:(j+7))=(F_blocks(i:(i+7),j:(j+7)).*Q1);
  endfor
endfor

invert_DCT_blocks=zeros(rows,columns);

for i=1:8:rows
  for j=1:8:columns
    invert_DCT_blocks(i:(i+7),j:(j+7))=idct2(invert_F_blocks(i:(i+7),j:(j+7)));
  endfor
endfor

transformed_f=uint8(invert_DCT_blocks);

temp_MSE=0;%Initializing temp_MSE to zero to calculate the double sum

for i=1:rows
  for j=1:columns
    temp_MSE=temp_MSE+double((f(i,j)-transformed_f(i,j))^2);%Updating temp_MSE for every pixel of the image
  endfor

endfor

FINAL_MSE=temp_MSE/(rows*columns);
fprintf("MSE FOR Q1=Q is %f\n",FINAL_MSE);

PSNR_1=10*log10((255^2)/FINAL_MSE);
fprintf("PSNR FOR Q1=Q is %f\n\n\n",PSNR_1);
%###################################################################################################
Q2=2*Q1;

f_blocks2=zeros(rows,columns);%Initializing an array for breaking the blocks image

%Breaking the f image in 8x8 blocks while also calculating dct2 for each block
for i=1:8:rows
  for j=1:8:columns
    f_blocks2(i:(i+7),j:(j+7))=dct2(f(i:(i+7),j:(j+7)));
    
  endfor
endfor


F_blocks2=zeros(rows,columns);%Initializing an array for breaking the blocks to zeros

for i=1:8:rows
  for j=1:8:columns
    F_blocks2(i:(i+7),j:(j+7))=round(f_blocks2(i:(i+7),j:(j+7))./Q2);
    
  endfor
endfor

y=entropy(abs(F_blocks2));
fprintf("ENTROPY OF abs(F_blocks2(i,j)) is %f\n",y);


invert_F_blocks2=zeros(rows,columns);

for i=1:8:rows
  for j=1:8:columns
    invert_F_blocks2(i:(i+7),j:(j+7))=(F_blocks2(i:(i+7),j:(j+7)).*Q2);
  endfor
endfor

invert_DCT_blocks2=zeros(rows,columns);

for i=1:8:rows
  for j=1:8:columns
    invert_DCT_blocks2(i:(i+7),j:(j+7))=idct2(invert_F_blocks2(i:(i+7),j:(j+7)));
  endfor
endfor

transformed_f2=uint8(invert_DCT_blocks2);

temp_MSE2=0;%Initializing temp_MSE to zero to calculate the double sum

for i=1:rows
  for j=1:columns
    temp_MSE2=temp_MSE2+double((f(i,j)-transformed_f2(i,j))^2);%Updating temp_MSE for every pixel of the image
  endfor

endfor

FINAL_MSE2=temp_MSE2/(rows*columns);
fprintf("MSE FOR Q2=2*Q1 is %f\n",FINAL_MSE2);

PSNR_2=10*log10((255^2)/FINAL_MSE2);
fprintf("PSNR FOR Q2=2*Q1 is %f\n\n\n",PSNR_2);
%###################################################################################################
Q3=4*Q1;

f_blocks3=zeros(rows,columns);%Initializing an array for breaking the blocks image

%Breaking the f image in 8x8 blocks while also calculating dct2 for each block
for i=1:8:rows
  for j=1:8:columns
    f_blocks3(i:(i+7),j:(j+7))=dct2(f(i:(i+7),j:(j+7)));
    
  endfor
endfor


F_blocks3=zeros(rows,columns);%Initializing an array for breaking the blocks to zeros

for i=1:8:rows
  for j=1:8:columns
    F_blocks3(i:(i+7),j:(j+7))=round(f_blocks3(i:(i+7),j:(j+7))./Q3);
    
  endfor
endfor

z=entropy((abs(F_blocks3)));
fprintf("ENTROPY OF abs(F_blocks3(i,j)) is %f\n",z);


invert_F_blocks3=zeros(rows,columns);

for i=1:8:rows
  for j=1:8:columns
    invert_F_blocks3(i:(i+7),j:(j+7))=(F_blocks3(i:(i+7),j:(j+7)).*Q3);
  endfor
endfor

invert_DCT_blocks3=zeros(rows,columns);

for i=1:8:rows
  for j=1:8:columns
    invert_DCT_blocks3(i:(i+7),j:(j+7))=idct2(invert_F_blocks3(i:(i+7),j:(j+7)));
  endfor
endfor

transformed_f3=uint8(invert_DCT_blocks3);

temp_MSE3=0;%Initializing temp_MSE to zero to calculate the double sum

for i=1:rows
  for j=1:columns
    temp_MSE3=temp_MSE3+double((f(i,j)-transformed_f3(i,j))^2);%Updating temp_MSE for every pixel of the image
  endfor

endfor

FINAL_MSE3=temp_MSE3/(rows*columns);
fprintf("MSE FOR Q3=4*Q1 is %f\n",FINAL_MSE3);

PSNR_3=10*log10((255^2)/FINAL_MSE3);
fprintf("PSNR FOR Q3=4*Q1 is %f\n\n\n",PSNR_3);

%##########################################################
%Getting the images to show on the screen
figure;
imagesc(f);
title('Original image f');
colormap(gray);



figure;
imagesc(transformed_f);
title('Transformed image f for Q=Q1');
colormap(gray);


figure;
imagesc(transformed_f2);
title('Transformed image f2 for Q=2*Q1');
colormap(gray);


figure;
imagesc(transformed_f3);
title('Transformed image f3 for Q=4*Q1');
colormap(gray);

