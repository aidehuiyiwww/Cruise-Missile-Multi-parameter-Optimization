clear;clc;close

startt=130;   dd=0.1;   endd=200;   

% V0 = 152.169240626444;
V0=startt:dd:endd;
Pmj =  14.3970150320742;
P1 = 0.634384192046982;
P2 =  0.288356536746303;
P0 = 499.999991273990;

Gws=zeros(1,length(V0));
judge=ones(1,length(V0));

for ii=1:length(V0)
    
    [Gws(ii), t04, Pmax5, Xd6, alpha_max7, a8, nyf9] = flight_model(V0(ii), Pmj, P1, P2, P0);
    if ~( V0>=150 & P1>P2 & 2.2*P2>=P1 & t04<5 & Pmax5<15 & Xd6<=8000 & alpha_max7<8 & a8==0 & nyf9>=2 )
        judge(ii)=0;
    end
end

L=Gws.*judge==0;
Gws(L)=[];
V0(L)=[];

plot(V0,Gws);
xlabel('V_{0}(m/s)')
ylabel('G_{WS}(kg)')
title('V_{0}对G_{WS}的影响')