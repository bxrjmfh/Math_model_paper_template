clear;clc;

data_path_1 = 'C:\Users\ASUS\Desktop\第五次数模模拟\第一问\附件1 近5年402家供应商的相关数据_供应商供货量.csv';   
data_path_2 = 'C:\Users\ASUS\Desktop\第五次数模模拟\第一问\附件1 近5年402家供应商的相关数据_企业订货量.csv';   

type = readmatrix(data_path_1,'OutputType','string');
type = type(:,2); 

load("S.mat")
[B,index] = sort(S,'descend');

ANS = [index(1:50)',B(1:50)'];

t = type(index(1:50));
T = zeros(50,1);
for i = 1:50
    if t(i) == 'A'
        T(i) = 1;
    elseif t(i) == 'B'
        T(i) = 2;
    else
        T(i) = 3;
    end
end
A = zeros(3,1);
A(1) = sum(T==1);
A(2) = sum(T==2);
A(3) = sum(T==3);

