A = imread('C:\Users\MaryChrisGo\Documents\1st Sem AY 2019-2020\App Physics 186\Act_6\2.png');
imshow(A);
scf(0);
title('Original Image');

A_lin = rgb2lin(A);
percentiles = 10;
illuminant = illumgray(A_lin,percentiles)
B_lin = chromadapt(A_lin,illuminant,'ColorSpace','linear-rgb');
B = lin2rgb(B_lin);

imshow(B);
scf(1);
title('Modified Image');
