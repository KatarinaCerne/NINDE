function skal = skalarniInt(g,h,ro,a,b)
%funkcija izraèuna skalarni produkt funkcij g in h glede na utež ro,
%èe integriramo po intervalu [a,b]
%vhod:
%g,h ... funkciji, katerih skalarni produkt raèunamo
%ro ... utež skalarnega produkta
%a,b ... meji intervala, po katerem integriramo
%izhod:
%skal ... vrednost skalarnega produkta

p = @(t) g(t).*h(t).*ro(t);
skal = integral(p,a,b);

end