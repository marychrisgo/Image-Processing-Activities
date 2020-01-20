sq = ones(5,5)
tr = zeros(3,4)
tr(:,1) = 1
tr(3,:) = 1
tr(2,2:3) =1
//tr(4,:) = 0
hw = zeros(10,10)
hw(1:2,:) = 1
hw(9:10, :) = 1
hw(:,1:2) =1
hw(:,9:10) =1
cr = zeros(5,5)
cr(:,3) =1
cr(3,:) =1

function new=makeshape(old)
    [ox oy] = size(old)
    nx = ox +4
    ny = oy +4
    new = zeros(nx, ny)
    new(.5*nx - .5*ox+1:.5*nx+.5*ox, .5*ny-.5*oy+1:.5*ny+.5*oy) = old
endfunction

SQ = makeshape(sq)
TR = makeshape(tr)
HW = makeshape(hw)
CR = makeshape(cr)


box = CreateStructureElement('square', 2);
vrect = CreateStructureElement('rectangle', [2,1]);
hrect = CreateStructureElement('rectangle', [1,2]);
crux = CreateStructureElement('custom', [%f %t %f; %t %t %t; %f %t %f]);
dia = CreateStructureElement('custom', [%f %t; %t %f]);

SQUARE = [SQ DilateImage(SQ, box) DilateImage(SQ, vrect) DilateImage(SQ,hrect) DilateImage(SQ,crux) DilateImage(SQ,dia)
          SQ ErodeImage(SQ, box) ErodeImage(SQ, vrect) ErodeImage(SQ,hrect) ErodeImage(SQ,crux) ErodeImage(SQ,dia)]
TRIANGLE = [TR DilateImage(TR, box) DilateImage(TR, vrect) DilateImage(TR,hrect) DilateImage(TR,crux) DilateImage(TR,dia)
          TR ErodeImage(TR, box) ErodeImage(TR, vrect) ErodeImage(TR,hrect) ErodeImage(TR,crux) ErodeImage(TR,dia)]
HOLLOW = [HW DilateImage(HW, box) DilateImage(HW, vrect) DilateImage(HW,hrect) DilateImage(HW,crux) DilateImage(HW,dia)
          HW ErodeImage(HW, box) ErodeImage(HW, vrect) ErodeImage(HW,hrect) ErodeImage(HW,crux) ErodeImage(HW,dia)]
CROSS = [CR DilateImage(CR, box) DilateImage(CR, vrect) DilateImage(CR,hrect) DilateImage(CR,crux) DilateImage(CR,dia)
          CR ErodeImage(CR, box) ErodeImage(CR, vrect) ErodeImage(CR,hrect) ErodeImage(CR,crux) ErodeImage(CR,dia)]
imshow(CROSS)
