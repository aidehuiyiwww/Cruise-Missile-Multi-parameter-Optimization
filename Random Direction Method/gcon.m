function g=gcon(x)
[f, g(1),g(2),g(3),g(4),g(5),g(6)] = flight_model(x(1), x(2), x(3), x(4), x(5));
g(7)=x(3)-x(4);
g(8)=2.2*x(4)-x(3);
end 