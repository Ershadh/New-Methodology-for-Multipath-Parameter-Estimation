clc;
clear all;
close all;
load('ACLN'); load('A_HALL'); % Loads Data Values from Measurement Datasets.
y=ACLN.D(1,1).data; yy=y(90:160)'; % Extraction of the non-zero Clean Signal part
% MP.A(7,7).data=zeros(1,length(ABRS.B(1,1).data));
% Correlation of the Signal Template with Received Signal
for i=1:4
    for j=1:10
x=AHALL.HA(i,j).data;
[z,lag]=xcorr(x,yy);
zi=find(lag==0);
zz=z(zi:end); zzs=zz.^2;
% Collecting the correlated signal samples into discrete bins of a definite size in accordance with the signal duration 
for k=0:383
tbin(k+1)=sum(zzs(16*k+1:16*(k+1)));
end
MP.HA(i,j).data=tbin; 
if(i==4&&j==4)
    break;
end
    end
end
% fs=20.48e9; ts=1/fs; t=(0:length(x)-1)*ts;

% figure(1);
% plot(t,x); grid on;
% figure(2);
% plot(yy); grid on;
% figure(3);
% plot(t,zz); grid on;

% figure(4);
% plot(t,zzs); grid on;
% figure(5);
% plot(t,zzs,[t(1) t(end)],0.3162*max(zzs)*[1 1],'r.-'); grid on;

tbinax=(0:383)*7.8125e-010;
figure(6);
plot(tbinax,tbin,[tbinax(1) tbinax(end)],0.3162*max(tbin)*[1 1],'r.-'); grid on;
