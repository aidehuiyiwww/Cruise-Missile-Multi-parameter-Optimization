
function [G] = conf(V_0, P_mj, P_1, P_2, P_0, t_0, P_max, R_min, alpha_max, dV_dt, n_y_f)
 
 g1 = V_0 - 150;
 g2 = P_1 - P_2;
 g3 = 2.2*P_2 - P_1;
 g4 = -t_0 + 5;
 g5 = -P_max + 15;
 g6 =  8000 - R_min;
 g7 = -alpha_max + 8;  % 角度
 g8 = -dV_dt + 0.1;
 g9 = n_y_f - 2;

 g10 = 200 - V_0;
 g11 = 16 - P_mj;
 g12 = P_mj - 10;
 g13 = P_1 -0;
 g14 = 1 - P_1;
 g15 = P_2 -0;
 g16 = 1 - P_2;
 g17 = P_0 - 300;
 g18 = 500 - P_0;

 G=[g1 g2 g3 g4 g5 g6 g7 g8 g9 g10 g11 g12 g13 g14 g15 g16 g17 g18];
 
end







