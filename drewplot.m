clc;clear;close all
testT = [5,10,15,20,25]*2;

for i = testT
floc=1  ;      %1Ghz
fser=100 ;     %100 Ghz
Tnum = i;        %任务数量 
Pcpu = 0.5 ;      %0.5W
Ptu = 2 ;         %2W
Rptu = 50 ;        %Mbps
rt = 0.5;         %时间权重
re = 0.5;         %能耗权重
K = 0;            %负载K
[T] = initTfunc(Tnum,floc,fser,Rptu); %初始化任务集T
Q = T(:,2);             %生成控制序列Q
Q0 = zeros(Tnum,1);     %生成控制序列Q0
Q1 = zeros(Tnum,1)+1;   %生成控制序列Q1


[K0,t0,e0]=KK(T,Tnum,Q0,Ptu,Pcpu,rt,re);
[K,t,e]=KK(T,Tnum,Q,Ptu,Pcpu,rt,re);
[K1,t1,e1]=KK(T,Tnum,Q1,Ptu,Pcpu,rt,re);
[Kbest,Qbest,tbest,ebest] = BPSO(T,Tnum,Q,Ptu,Pcpu,rt,re);


%result = [Tnum,K,K0,K1];
%dlmwrite('result1.txt',result,'-append');

result = [Tnum,t,t0,t1,tbest];
dlmwrite('resulttime.txt',result,'-append');

result = [Tnum,e,e0,e1,ebest];
dlmwrite('resulte.txt',result,'-append');

result = [Tnum,K,K0,K1,Kbest];
dlmwrite('resultk.txt',result,'-append');
clc;clear;close all;
end 
%load resulte.txt;
%efplot(resulte);

