clear all;clc
eps=0.0001;
n = 5;
k = 6;
a =[150 13 0.5 0 300];
b =[160 15 1 1 500];
x0=[153 13.685 0.678 0.311 375];
x0=x0';
Xk=chushifuhexing(x0,k,a,b)
LLL=1;
num=1;
plot_value(1)=minf(x0);
Yvalue=zeros(k,1);
while(LLL)
    num=num+1
    for j=1:k
        [Gws, t04, Pmax5, Xd6, alpha_max7, a8, nyf9] = flight_model(Xk(1,j), Xk(2,j),Xk(3,j),Xk(4,j),Xk(5,j));
        Yvalue(j) = Gws;
    end
    [SXPL,XBZ] = sort(Yvalue);
    plot_value(num)=minf( Xk(:,XBZ(1)));
    sum1=0;
    Xm=Xk
    Y=SXPL(1)
    Xmin=Xk(:,XBZ(1))
    for m=1:k
        sum1 = sum1+( minf(Xk(:,m))-minf( Xk(:,XBZ(1)) ) ).^2;
    end
    if ( (sum1/(k-1))^(1/2)<=eps) 
        X=Xk(:,XBZ(1));
        Minvalue = minf( Xk(:,XBZ(1)))
        LLL=0;
        break;            
    end
    while(1)
        sum2 = zeros(length(x0),1);
        for m=1:k
            sum2 = sum2+Xk(:,m);
        end
        sum2 = sum2-Xk(:,XBZ(length(XBZ)));
        Xc2 = sum2/(k-1);
        Goinitalpoint=0;
        if (judge(Xc2)~=0)
            a=Xk(:,XBZ(1));                 
            b=Xc2;                          
            Goinitalpoint=1;                
           break; 
        end
        alph=1.3;
        flag=0;
        while(1)
            Xr=Xc2+alph.*(Xc2-Xk(:,XBZ(length(XBZ))));
            Gofuhexingdiedai=0;
            if (judge(Xr)~=0)
                alph=0.5*alph;
                if(alph<=0.1)
                    flag=flag+1;
                    Xk(:,XBZ(length(XBZ))) = Xk(:,XBZ(length(XBZ)-1));
                    alph=1.3;
                    if(flag>=2)
                        a=Xk(:,XBZ(1));                 
                        b=Xr;
                        Goinitalpoint=2;
                        break;
                    end
                    continue;
                end
            else
                if(minf(Xr)<minf(Xk(:,XBZ(length(XBZ)))))
                    Xk(:,XBZ(length(XBZ)))=Xr;
                    Gofuhexingdiedai=1;
                    flag=0;
                    break;
                else
                    alph=0.5*alph;
                    if(alph<=0.1)
                        Xk(:,XBZ(length(XBZ))) = Xk(:,XBZ(length(XBZ)-1));
                        alph=1.3;
                        flag=flag+1;
                        if(flag>=2)
                          a=Xk(:,XBZ(1));                 
                          b=Xr;
                          Goinitalpoint=2;
                          break;
                        end
                        continue;
                    end
                end
            end
        end
        if(Gofuhexingdiedai~=0)
            break;
        end
        if(Goinitalpoint==2)
            break;
        end
    end
    if(Goinitalpoint~=0)
        Xk=chushifuhexing(x0,k,a,b)
    end
end
x=1:1:num;
y=plot_value(x);
plot(x,y)