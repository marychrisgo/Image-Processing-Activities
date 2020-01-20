img = imread('C:\Users\MaryChrisGo\Documents\1st Sem AY 2019-2020\App Physics 186\Act_5\haha.JPG');
img_gs = rgb2gray(img);
gs_min = min(img_gs);
gs_max = max(img_gs);
disp("minimum = "); disp(gs_min); 
disp("maximum = "); disp(gs_max);
[r,c] = size(img_gs);
imwrite(img_gs, 'C:\Users\MaryChrisGo\Documents\1st Sem AY 2019-2020\App Physics 186\Act_5\haha_gs.JPG');


//displays the histogram of the original image 
scf(0);
subplot(211); histplot(256, double(img_gs));
xlabel('pixel values');
ylabel('intensity');
xtitle("Histogram of the Original Image");
//displays the CDF of the original image 
scf(0);
[counts_o, bins_o] = imhist(img_gs);
CDF_o = cumsum(counts_o)/length(img_gs);
subplot(212); plot(CDF_o);
xlabel('pixel values');
ylabel('T(r)');
xtitle("CDF of Original Image");

//desired linear CDF
scf(1);
x = [0:255];
des_CDF = x/255.0; 
subplot(311);
xlabel('pixel values');
ylabel('T(r)');
plot(des_CDF);
xtitle("Desired CDF");
//desired quadratic CDF 
scf(1);
des_2CDF = x.^2/(255.0^2);
subplot(312);
xlabel('pixel values');
ylabel('T(r)');
plot(des_2CDF);
xtitle("Desired cumulative distribution function (quadratic)");
//desired erf CDF 
scf(1);
range1 = linspace(-2,2,256);
des_3CDF = 0.5*(erf(range1)+1);
subplot(313);
xlabel('pixel values');
ylabel('T(r)');
plot(des_3CDF);
xtitle("Desired CDF (erf)")

//backprojection
d = splin(x,des_CDF);
[yy, yya, yyb] = interp(CDF_o, des_CDF, x, d);
newimg = img_gs;
for i = 0:255
    newimg(find(img_gs == i)) = yy(i+1);
end 
imwrite(newimg, "C:\Users\MaryChrisGo\Documents\1st Sem AY 2019-2020\App Physics 186\Act_5\haha_linear.JPG")

//displays the histogram of the modified image
scf(2); 
subplot(211);
xlabel('pixel values');
ylabel('intensity');
histplot(256, double(newimg));
xtitle("Histogram of linear image");
//displays the CDF of the modified image
[counts_e, bins_e] = imhist(newimg);
CDF_e = cumsum(counts_e)/length(newimg);
scf(2);
subplot(212);
xlabel('pixel values');
ylabel('T(r)');
plot(CDF_e);
xtitle("CDF of linear image");


