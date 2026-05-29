function [Gws, t04, Pmax5, Xd6, alpha_max7, a8, nyf9] = flight_model(V0, Pmj, P1, P2, P0)
Gp = 755;      
H = 300;       
Isj = 200;     
Is = 230;      
thetam = pi/8; 
g  = 9.80;     
X0 = 0;
Y0 = 0;
V00 = 0;
theta0 = thetam;
M00 = V00/340;
x = [V00; X0; Y0; theta0; 0; 0; 0; 0; 0; P1; M00; Is; P2; P0];
i0 = 1;
h = 0.01;
while x(1)<=V0
   FF1(:, i0) = x;
   t0 = i0*h;
   x(1) = x(1)+g*(Pmj-sin(thetam))*h;
   x(2) = 0.5*x(1)*t0*cos(thetam);
   x(3) = 0.5*x(1)*t0*sin(thetam);
   i0 = i0+1;
end

KFj1 = V0*Pmj/(g*Isj*(Pmj-sin(thetam)));
KFj = KFj1/(1+0.5*KFj1);
Xd0 = V0^2*cos(thetam)/(2*g*(Pmj-sin(thetam)));
Yd0 = V0^2*sin(thetam)/(2*g*(Pmj-sin(thetam)));

t04 = V0/(g*(Pmj-sin(thetam)));     
Pmax5 = Pmj/(1-0.5*KFj1);          

i1 = i0;
u0 = 0;
M0 = V0/(20.055*sqrt(288.16-0.0065*Yd0));
ny0 = cos(theta0)-thetam*V0^2*sin(thetam)/(g*(H-Yd0));
rho0 = 0.12492*(1-Yd0/44332)^4.2563;
alpha0 = ny0*(1-u0)/(P1/57.3+Cyb(M0)*rho0*V0^2/(2*P0));
nyf0 = 1/(1-u0)*(P1*sind(alpha0)+Cyb(M0)*alpha0*rho0*V0^2/(2*P0));
x = [V0; Xd0; Yd0; theta0; u0; ny0; rho0; alpha0; nyf0; P1; M0; Is; P2; P0];

while x(3)<H-0.01
    FF1(:, i1) = x;
    x = RK4_rise(i1*h, x, h);
    x(11) = x(1)/(20.055*sqrt(288.16-0.0065*x(3)));
    x(4) = thetam*(H-x(3))/(H-Yd0);
    x(6) = cos(x(4))-thetam*x(1)^2*sin(x(4))/(g*(H-Yd0));
    x(7) = 0.12492*(1-x(3)/44332)^4.2563;
    x(8) = x(6)*(1-x(5))/(P1/57.3+Cyb(x(11))*x(7)*x(1)^2/(2*P0));
    x(9) = 1/(1-x(5))*(P1*sind(max(FF1(8, :)))+Cyb(x(11))*max(FF1(8, :))*x(7)*x(1)^2/(2*P0));
    i1 = i1+1;
end
t1 = (i1-1)*h;
i2 = i1;
nyf9 = FF1(9, i1-1);        


x(3) = H;
x(6) = 1;
x(4) = 0;
while x(1)<312.5
    FF1(:, i2) = x;
    x = RK4_parallelfly(i2, x, h);
    x(11) = x(1)/(20.055*sqrt(288.16-0.0065*H));
    x(8) = (1-x(5))/(P1/57.3+Cyb(x(11))*x(7)*x(1)^2/(2*P0));
    i2 = i2+1;
end

Xd6 = FF1(2, i2-1);      
t2 = (i2-1)*h;
i3 = i2;
a8 = 0; 
x(3) = H;
x(6) = 1;
x(4) = 0;



while x(2)<=55000
    FF1(:, i3) = x;
    x = RK4_swoop(i3, x, h);
    x(11) = x(1)/(20.055*sqrt(288.16-0.0065*H));
    x(8) = (1-x(5))/(P2/57.3+Cyb(x(11))*x(7)*x(1)^2/(2*P0));
    if FF1(1, i3)<FF1(1, i3-1)
        a8 = 1;
    end
    i3 = i3+1;
end

alpha_max7 = max(FF1(8, :));


KF = FF1(5, end);
Tt = (i3-i0-1)*h;
Kj = (1+1.2+0.225*1.2)*KFj;
Kpp = KF+KF*(0.07+0.095*Is/Tt);
Ks = 0.12-0.11*KF*(KF+0.18)+12.0/P0+0.927*12.0/P0+0.0082+7e-5*Tt;
Gws = Gp/((1-Kj)*(1-Ks-Kpp));

end