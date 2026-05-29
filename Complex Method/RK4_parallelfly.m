function X=RK4_parallelfly(t,X0,h)

%功能：            四阶龙格-库塔积分算法

% t                      时间节点
% X0                     初始值
% Proportional guidance  求导方程右边的含t和X的函数
% h                      每次积分的间隔
% X                      输出为龙格库塔积分的单步结果

K1=parallelfly(t,X0);
K2=parallelfly(t+h/2,X0+h*K1/2);
K3=parallelfly(t+h/2,X0+h*K2/2);
K4=parallelfly(t+h,X0+h*K3);

X=X0+h*(K1+2*K2+2*K3+K4)/6;

end