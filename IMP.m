% An efficient way to Import Measurement Datasets 
clc;
clear all;
close all;
str1='AHW7FD';
str2='.DAT';
for i=1:4
    for j=1:10
    str= strcat(str1,num2str(i-1),num2str(j-1),str2);
AHALL.HA(i,j)=importdata(str,'s',13); % Organizing into Data Strucutres
if(i==4 && j==4) % Depends on the number of available grid points or (x,y) co-ordinate data for the currently imported dataset 
    break; end
    end  
end
