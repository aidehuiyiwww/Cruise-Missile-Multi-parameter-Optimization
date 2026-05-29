function [y,Gws] = g(zibianliang)
[Gws, t04, Pmax5, Xd6, alpha_max7, a8, nyf9] = flight_model(zibianliang);
V0 = zibianliang(1);
Pmj = zibianliang(2);
P1 = zibianliang(3);
P2 = zibianliang(4);
P0 = zibianliang(5);
%新建函数为m个不等式约束gi<=0,如果没有不等式约束，则令y=0
y(1)=150-V0;
y(2)=P2-P1;
y(3)=P1-2.2*P2;
y(4)=t04-5;
y(5)=Pmax5-15;
y(6)=Xd6-8000;
y(7)=alpha_max7-8;
y(8)=a8-0.1;
y(9)=2-nyf9;
y(10)=V0-200;
y(11)=10-Pmj;
y(12)=Pmj-16;
y(13)=-P1;
y(14)=P1-1;
y(15)=-P2;
y(16)=P2-1;
y(17)=P0-500;
y(18)=300-P0;
end