% [X,FX]=penalty1([153 13.685 0.678 0.311 375])
%外点罚函数法，需要给出fun函数以及初始点
%设置全局变量r，给出罚因子r，权数为5，设置精度，定义全局TextF函数
clc;
clear all;
close all;
r=1;
c=0.2;
zibianliang0=[153 13.685 0.678 0.311 375];
sign=0; 
err=1e-6;
f=@test;
options = optimset('Display','iter','PlotFcns',@optimplotfval);
[zibianliang,fx] = fminsearch(f,zibianliang0,options,r);
% % % [zibianliang,fx] = fminunc(f,zibianliang0,options,r);
% 开始迭代
while abs(norm(zibianliang-zibianliang0)) > err
    r=c*r;
    zibianliang0=zibianliang;
    options = optimset('PlotFcns',@optimplotfval);
    [zibianliang,fx] = fminsearch(f,zibianliang0,options,r);
    sign=sign+1;
    if sign >100
        r=Inf;
        [zibianliang,fx] = fminsearch(f,zibianliang0,options,r);
        break;
    end
    
end
% X=zibianliang;
% FX=fx;
% end