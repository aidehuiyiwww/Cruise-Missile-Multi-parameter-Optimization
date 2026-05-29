clc;
clear;

tol = 1e-2;
X0 = [153 13.685 0.678 0.311 375];
Klimit = 20;
k = 0;
[GWS,t_0,P_max,R_min,alpha_max,dV_dt,n_y_f] = flight_model(X0(1), X0(2), X0(3), X0(4), X0(5));
Gt=conf(X0(1), X0(2), X0(3), X0(4), X0(5), t_0, P_max, R_min, alpha_max, dV_dt, n_y_f);

global T S;
T = find(Gt>0); % 内点下标
S = find(Gt<=0); % 非内点下标

r = 1;
while isempty(S)~=1

    f=@t_noconf;
    options = optimset('Display','iter');
    X1 = fminsearch(f,X0,options,r);
    X0 = X1;
    [GWS,t_0,P_max,R_min,alpha_max,dV_dt,n_y_f] = flight_model(X0(1), X0(2), X0(3), X0(4), X0(5));

    G=conf(X0(1), X0(2), X0(3), X0(4), X0(5), t_0, P_max, R_min, alpha_max, dV_dt, n_y_f);
    T=find(G>0); % 内点下标
    S=find(G<=0); % 非内点下标
    r = r*0.1;
    disp(X0);
 
end


f=@new_noconf;
r = 1;
options = optimset('PlotFcns',@optimplotfval);
X1 = fminsearch(f,X0,options,r);

while abs(norm(X1-X0))>tol %迭代终止条件
    X0=X1;
    r =r *0.1;
    k=k+1;
    disp(['迭代次数',num2str(k)])
    f=@new_noconf;
    [X1, fval] = fminsearch(f,X0,options,r);
    disp(X1);
    if k>Klimit
        break;
    end
end
 
