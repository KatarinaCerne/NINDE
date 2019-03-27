n=5;
ro = @(x) 4.*x.^2.*(4-x);
am=0;
bm=4;

a_sez = zeros(1,n); %a_i = a_sez(i)
b_sez = zeros(1,n+1); %b_i = b_sez(i)
polQ{1} = @(t) 0; % 1 --> -1 to je Q_{-1}
b_sez(1)=sqrt(skalarniInt(@(t) 1, @(t) 1, ro, am,bm));
polQ{2} =@(t) 1/b_sez(1); % 2 --> 0 to je Q_{0}

a_sez(1) = skalarniInt(@(t) t.*polQ{2}(t), @(t)polQ{2}(t),@(t)ro(t), am, bm);
Qkaca{3} = @(t) (t-a_sez(1))*polQ{2}(t) - b_sez(1)*polQ{2}(t);
b_sez(2) = sqrt(skalarniInt(Qkaca{3}, Qkaca{3}, ro, am, bm));
polQ{3} = @(t) (1/b_sez(2))*Qkaca{3}(t);
%-----------------------------------------------------------------------------------

alfa = zeros(1,n);
[a_sez,b_sez,polQ] = ONbaza(n,ro,am,bm);
A = spdiags([b_sez(2:end)',a_sez',b_sez(1:end-1)'],[-1,0,1],n,n); 
[V,D]=eig(full(A)); 
Z=zeros(n);
xn = diag(D); %lastne vrednosti spravimo v stolpec xn

for i=1:n
    Z(:,i)=V(:,i)/norm(V(:,i));    %normiramo lastne vektorje
end

for i=1:n
   alfa(i)=integral(ro,am,bm)*Z(1,i)^2; %izraèunamo uteži alfa_{j,n}
end
