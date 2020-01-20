flist =[]
dlist =[]

i = 1
while i<54

if sum(sizelist(i)==[180:210])
if sum(xlist(i)==[35:38])
flist = [flist 261.63*2]
dlist =[dlist 1]
end
if sum(xlist(i)==[26:32])
flist = [flist  293.66*2]
dlist =[dlist 1]
end
if sum(xlist(i)==[19:25])
flist = [flist  329.63*2]
dlist =[dlist 1]
end
if sum(xlist(i)==[39:45])
flist = [flist  246.94*2]
dlist =[dlist 1]
end
if sum(xlist(i)==[43:50])
flist = [flist  220.00*2]
dlist =[dlist 1]
end

end
if sum(sizelist(i)==[40:60])
if sum(xlist(i+1)==[36:42])
flist = [flist  261.63*2]
dlist =[dlist 2]
end
if sum(xlist(i+1)==[29:35])
flist = [flist  293.66*2]
dlist =[dlist 2]
end
if sum(xlist(i+1)==[22:28])
flist = [flist  329.63*2]
dlist =[dlist 2]
end
if sum(xlist(i+1)==[48:54])
flist = [flist  220.00*2]
dlist =[dlist 2]
end
if sum(xlist(i+1)==[54:60])
flist = [flist 196.0*2]
dlist =[dlist 2]
end
i = i+1
end
if sum(sizelist(i)==[180])
flist =[flist 1]
dlist =[dlist 1]
end

if sum(sizelist(i)==[26])
if sum(sizelist(i+1)==26)
flist =[flist flist]
dlist =[dlist dlist]
i=i+1;
else
dlist(size(dlist,2))=dlist(size(dlist,2))+1
end
end

i=i+1;
end

function n = note_func(f, t)
n = sin(2*%pi*f*linspace(0,t,8192*t));
line1 = linspace(0, 1, 410*t); 
line2 = linspace(1, 1, 819*t); 
line3 = linspace(1, 0.9, 819*t); 
line4 = linspace(0.9, 0.45, 5734*t); 
line5 = linspace(0.45, 0, 410*t); 
envp=[line1,line2,line3,line4,line5];
n=n.*envp
endfunction;

