function res_in=res_compare(x)
    if (x(1)<5 && x(2)<15 && x(3)<=8000 && x(4)<8 && x(5)<0.1 && x(6)>=2 && x(7)>=0 && x(8)>=0)
        res_in=0;
    else
        res_in=1;
    end 
end