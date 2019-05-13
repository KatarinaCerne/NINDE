function Yprime = primer3(x,Y)
%sistem enaèb 1. reda, preveden iz enaèbe 2. reda, dane v 3. nalogi
%Y in Yprime sta vrstici
Yprime=[Y(2),1/3*Y(1)^2*Y(2)-3*Y(1)*x];
end