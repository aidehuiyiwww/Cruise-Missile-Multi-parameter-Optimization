% function m=test(zibianliang,r) 
% [y,Gws] = g(zibianliang);
% m = Gws+r*(sum(max(y,0).^2));
% end

function m=test(zibianliang,r) 
[y,Gws] = g(zibianliang);
y(y>0) = 0;
m = Gws-r*sum(log(-y));
end