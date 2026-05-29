clear;clc

V0 = 153;
Pmj = 13.685;
P1 = 0.678;
P2 = 0.311;
P0 = 375;
zibianliang=[V0, Pmj, P1, P2, P0];
[Gws, t04, Pmax5, Xd6, alpha_max7, a8, nyf9] = flight_model([153 13.685 0.678 0.311 375]);