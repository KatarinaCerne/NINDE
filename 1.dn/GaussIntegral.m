function I = GaussIntegral(f,n,ro,am,bm)
%funkcija GaussIntegral izraèuna približek za integral funkcije f z
%Gaussovim integracijskom pravilom na intervalu [am,bm] z utežjo ro in n+1 vozli
%vhod:
%f ... funkcija, ki jo integriramo
%n ... število vozlov
%ro ... utež
%am, bm ... krajišèi intervala, po katerem integriramo
%izhod:
%I ... vrednost približka za integral funkcije f po intervalu [am,bm]

[alfa,xn] = GaussUteziVozli(n,ro,am,bm); %izraèunamo uteži in vozle Gaussovega integracijskega pravila
%uteži so shranjene v seznamu alfa, vozli so shranjeni v stolpcu xn
I=0;
for i=1:n
   I=I+alfa(i)*f(xn(i)); 
end

end