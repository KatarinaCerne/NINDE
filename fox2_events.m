function [value,isterminal,direction]=fox2_events(t,y)
r=sqrt(1+t)*[cos(t);sin(t)];
value=norm(r-y)-10^(-4); %vrednosti, za katere ode45 gleda, kdaj so 0
isterminal=1; %ko je value=0, ustavi ra�une, vrne error
%�e bi dali isterminal=0, samo snema dogodke in gre naprej, se ne ustavi
direction=-1; %zanimajo nas padajo�e vrednosti
%�e nas zanimajo nara��ajo�e =1, �e nas zanima oboje =0

end