function IS=simpson(fun,a,b)
%funkcija simpson raèuna približek IS integrala funkcije fun na intervalu
%[a,b] po simpsonovem pravilu na toèkah a, (a+b)/2 in b.
h=(b-a)/2; %korak pri simpsonovem pravilu
IS=h/3*(fun(a)+4*fun(a+h)+fun(b));
end