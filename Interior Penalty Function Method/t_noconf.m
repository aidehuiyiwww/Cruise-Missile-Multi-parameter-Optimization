function N_G=t_noconf(X0, r)

global T S;
[~,t_0,P_max,R_min,alpha_max,dV_dt,n_y_f] = flight_model(X0(1), X0(2), X0(3), X0(4), X0(5));


Gt=conf(X0(1), X0(2), X0(3), X0(4), X0(5), t_0, P_max, R_min, alpha_max, dV_dt, n_y_f);

Gt(Gt<0) = 0;
N_G=-sum(Gt(S)) + r*sum(1./(Gt(T)));

end