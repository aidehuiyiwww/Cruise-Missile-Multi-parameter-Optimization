function Y= minf(x)
V0=x(1);
Pmj=x(2);
P1=x(3);
P2=x(4);
P0=x(5);
[Gws, t04, Pmax5, Xd6, alpha_max7, a8, nyf9] = flight_model(V0, Pmj, P1, P2, P0);
Y=Gws;
end
