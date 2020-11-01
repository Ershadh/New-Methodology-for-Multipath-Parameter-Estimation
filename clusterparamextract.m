load('prmextrpdrmv10dBA');
load('GMP');

A=DRFMP.A(1,1).data;
A1=GMP(1).data.A(1,1).data;
[sa,ai]=sort(A,'descend');
fai=ai(1);
x=ai(1);
for i=1:numel(A)    
    if(ai(i)>x)
        fai=[fai ai(i)];
        x=ai(i);
    end
end
clsindx=find(A(fai));
ACT=fai(clsindx);
ACA=A(fai(clsindx));
DCI=(ACA>=0.3*max(ACA));
DCIA=ACA(DCI);
DCIT=ACT(DCI);
DC=0.7692*[DCIT(end)-DCIT(1)];
figure(1);
plot(A1(STAA+1:end)); hold on;
plot(DCIT,DCIA,'ro'); hold off;