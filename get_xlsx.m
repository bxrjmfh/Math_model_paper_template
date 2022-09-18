%高钾玻璃 未风化
%高钾玻璃 风化
%高钾玻璃 严重风化
%铅钡玻璃 未风化
%铅钡玻璃 风化 
%铅钡玻璃 严重风化 
clc;clear;

load("index.mat")
load('data2_mat.mat')

data2_mat(:,end) = [];

d1 = data2_mat(index1,:);
d2 = data2_mat(index2,:);
d3 = data2_mat(index3,:);
d4 = data2_mat(index4,:);
d5 = data2_mat(index5,:);
d6 = data2_mat(index6,:);

writematrix(d1,'d1.xlsx','WriteMode','append');
writematrix(d2,'d2.xlsx','WriteMode','append');
writematrix(d3,'d3.xlsx','WriteMode','append');
writematrix(d4,'d4.xlsx','WriteMode','append');
writematrix(d5,'d5.xlsx','WriteMode','append');
writematrix(d6,'d6.xlsx','WriteMode','append');