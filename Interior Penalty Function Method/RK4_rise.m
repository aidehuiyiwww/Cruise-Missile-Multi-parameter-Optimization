function X=RK4_rise(t,X0,h)

%功能：            四阶龙格-库塔积分算法

% t                      时间节点
% X0                     初始值
% Proportional guidance  求导方程右边的含t和X的函数
% h                      每次积分的间隔
% X                      输出为龙格库塔积分的单步结果

K1=Proportional_guidance(t,X0);
K2=Proportional_guidance(t+h/2,X0+h*K1/2);
K3=Proportional_guidance(t+h/2,X0+h*K2/2);
K4=Proportional_guidance(t+h,X0+h*K3);

X=X0+h*(K1+2*K2+2*K3+K4)/6;

end