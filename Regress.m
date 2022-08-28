clear;clc;

data_path = 'C:\Users\ASUS\Desktop\第四次模拟赛\output data';

load(strcat(data_path,'\vector.mat'));
[b,bint,r,rint,stats] = regress(vector(:,1),[ones(height(vector),1),vector(:,4:8)]);