function [min,fmin]=golden(low,up,length)
global TextF;   %声明全局函数TextF
%黄金分割法初始化，需要给出最下限和最上限以及精度
%第0轮
flag=0;
a1=low;a3=up;
f1=TextF(a1);f3=TextF(a3);
a11=a1+0.382*(a3-a1);f11=TextF(a11);
a12=a1+0.618*(a3-a1);f12=TextF(a12);
lowbound=a1;
upbound=a3;
%第flag轮，结束循环标志为步长足够小，或者进行了300轮
while norm(a3-a1)>=length
    flag=flag+1;
    lowbound=a1;
    upbound=a3;
    if f12>f11
      a3=a12;f3=f12;
      a12=a11;f12=f11;
      a11=a1+0.382*(a3-a1);
      f11=TextF(a11);
    else
      a1=a11;f1=f11;
      a11=a12;f11=f12;
      a12=a1+0.618*(a3-a1);
      f12=TextF(a12);
    end
    if flag>300
        break;
    end
end
min=(lowbound+upbound)/2;
fmin=TextF(min);