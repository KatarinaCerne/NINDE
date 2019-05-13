n=16;
tpts=linspace(0,3,n);
ypts=linspace(-1,1,n);
[t,y]=meshgrid(tpts,ypts);
pt=ones(size(y));
py=-y-5*exp(-t)*sin(5*t);
quiver(t,y,pt,py,1.5); %izriše vektorsko polje