function [a_sez,b_sez,polQ] = ONbaza(n,ro,am,bm)
%funkcija vrne ortonormirano bazo polinomov do stopnje n glede na nek prej
%doloèen skalarni produkt (ro je utež skalarnega produkta, ki ga raèunamo
%integral po intervalu [am,bm])
%vhod:
%n ... najvišja stopnja polinomov, ki sestavljajo bazo
%ro ... utež skalarnega produkta
%am, bm ... meji, po katerih raèunamo skalarni produkt
%izhod:
%polQ je seznam baznih polinomov od Q_{-1} do Q_n
%Q_n = polQ{n+2} je stopnje n
%a_sez = (a_i)_{i=1,...,n} ...seznam koeficientov a_i v trièlenski zvezi
%b_sez = (b_i)_{i=1,...,n} ...seznam koeficientov b_i v trièlenski zvezi

a_sez = zeros(1,n); %a_i = a_sez(i)
b_sez = zeros(1,n+1); %b_i = b_sez(i)
polQ{1} = @(t) 0; % 1 --> -1 to je Q_{-1}
b_sez(1)=sqrt(skalarniInt(@(t) 1, @(t) 1, ro, am,bm));
polQ{2} =@(t) 1/b_sez(1); % 2 --> 0 to je Q_{0}


for i=1:n
   a_sez(i) = skalarniInt(@(t) t.*polQ{i+1}(t), polQ{i+1},ro, am, bm); %polQ{i+1} --> Q_{i-1}, sepravi polQ{2}=Q_0, polQ{3}=Q_1 itd.
   Qkaca{i+2} = @(t) (t-a_sez(i)).*polQ{i+1}(t) - b_sez(i).*polQ{i}(t);
   b_sez(i+1) = sqrt(skalarniInt(Qkaca{i+2}, Qkaca{i+2}, ro, am, bm));
   polQ{i+2} = @(t) (1/b_sez(i+1)).*Qkaca{i+2}(t);
   
%    b(i+1) = sqrt(skalarni(@(t) (t-a(i))*polQ{i+1}(t) - b(i)*polQ{i}(t), @(t) (t-a(i))*polQ{i+1}(t) - b(i)*polQ{i}(t), x));
%    polQ{i+2} = @(t) (1/b(i+1))*(t-a(i))*polQ{i+1}(t) - b(i)*polQ{i}(t);
end

end

%Q_{-1}=0
%beta_1 = ||1||
%Q_0 = 1/beta_1
%for i=1:n
%alfa_i=<xQ_{i-1},Q_{i-1}>
%Qkaca_i = (x-alfa_i)*Q_{i-1}-beta_i*Q_{i-2}
%beta_{i+1} = ||Qkaca_i||
%Q_i = 1/beta_{i+1} * Qkaca_i