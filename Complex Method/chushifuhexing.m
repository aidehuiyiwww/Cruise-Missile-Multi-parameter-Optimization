function Xk=chushifuhexing(x0,k,a,b)
Xk=zeros(length(x0),k);
Xk(:,1)=x0;
i=1;
while(i<k)
        i=i+1;
        for j=1:length(x0)
            Xk(j,i)= a(j)+rand().*(b(j)-a(j));
        end
        while(judge(Xk(:,i))~=0)
            Xc=zeros(length(x0),1);
            for j=1:i-1
                Xc=Xc+Xk(:,j);
            end
            Xc=(1/i)*Xc;
            if(judge(Xc)~=0)
                i=i-1;
                break;
            else
                while(judge(Xk(:,i))~=0) 
                    Xk(:,i)=Xc+0.5*(Xk(:,i)-Xc);
                end
            end
        end
    end