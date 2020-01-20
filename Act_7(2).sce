im = double(imread('C:\Users\MaryChrisGo\Documents\1st Sem AY 2019-2020\App Physics 186\Act_7\cancercells.jpg'));
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);
I = R+G+B;
I(find(I==0)) = 100000;
r = R./I
g = G./I
b = B./I
ROI = double(imread('C:\Users\MaryChrisGo\Documents\1st Sem AY 2019-2020\App Physics 186\Act_7\ccregion.jpg'))
R_ROI = ROI(:,:,1)
G_ROI = ROI(:,:,2)
B_ROI = ROI(:,:,3)
I_ROI = R_ROI + G_ROI + B_ROI;
I_ROI(find(I_ROI==0)) = 100000;
r_ROI = R_ROI./I_ROI;
g_ROI = G_ROI./I_ROI;

BINS = 32;
rint = round(r_ROI*(BINS-1) +1);
gint = round(g_ROI*(BINS-1) +1);
colors = gint(:) + (rint(:)-1)*BINS;
hist = zeros(BINS, BINS);
for row = 1:BINS
    for col = 1:(BINS-row+1)
        hist(row,col) = length(find(colors==(((col+(row-1)*BINS)))));
        end;
end;

//imshow(hist)
scf(0)

imsize = size(im)
NPS_ROI = zeros(imsize(1), imsize(2))
for i = 1: imsize(1)
    for j=1:imsize(2)
        rnew = round(r(i,j)*(BINS-1) +1);
        gnew = round(g(i,j)*(BINS-1) +1);
        NPS_ROI(i,j) = hist(rnew, gnew);
        end
end

imshow(NPS_ROI)
scf(1)
