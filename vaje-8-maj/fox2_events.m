function [value,isterminal,direction]=fox2_events(t,y)
r=sqrt(1+t)*[cos(t);sin(t)];
value=norm(r-y)-10^(-4); %vrednosti, za katere ode45 gleda, kdaj so 0
isterminal=1; %ko je value=0, ustavi raèune, vrne error
%èe bi dali isterminal=0, samo snema dogodke in gre naprej, se ne ustavi
direction=-1; %zanimajo nas padajoèe vrednosti
%èe nas zanimajo narašèajoèe =1, èe nas zanima oboje =0

end