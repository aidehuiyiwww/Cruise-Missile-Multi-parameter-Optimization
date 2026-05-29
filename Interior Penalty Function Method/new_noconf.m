function N_G=new_noconf(X,r)


[GWS,t_0,P_max,R_min,alpha_max,dV_dt,n_y_f] = flight_model(X(1), X(2), X(3), X(4), X(5));

Gt=conf(X(1), X(2), X(3), X(4), X(5), t_0, P_max, R_min, alpha_max, dV_dt, n_y_f);



Gt(Gt<0) = 0;


N_G = GWS - r*sum(log(Gt));


end
