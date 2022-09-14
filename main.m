%% 保障企业生产重要性的数学模型
% 选择50家企业作为最重要的供货商

clear;clc;
data_path_1 = 'C:\Users\ASUS\Desktop\第五次数模模拟\第一问\附件1 近5年402家供应商的相关数据_供应商供货量.csv';   
data_path_2 = 'C:\Users\ASUS\Desktop\第五次数模模拟\第一问\附件1 近5年402家供应商的相关数据_企业订货量.csv';   

type = readmatrix(data_path_1,'OutputType','string');
type = type(:,2); 

data_1 = readmatrix(data_path_2,'OutputType','double'); % 企业订货量
data_1 = data_1(:,3:end);
data_2 = readmatrix(data_path_1,'OutputType','double'); % 供应商供货量
data_2 = data_2(:,3:end);

a = [a1(data_1,data_2)',a2(data_1,data_2)',a3(data_2,type)',a4(data_1)',a5(data_1,data_2)'];

for i = 1:5 % 归一化
    a(:,i) = (a(:,i)-min(a(:,i))) ./ (max(a(:,i))-min(a(:,i)));
end

for i = 1:5
    P(:,i) = a(:,i) / sum(a(:,i));
end

P0 = P;
P0(P==0) = 1;

e = -(1/log(402)).*sum(P.*log(P0),1);
g = 1-e;
w = g./sum(g);
w(5) = w(5) - 0.1;
w(1) = w(1) + 0.1;
for i = 1:402
    S(i) = sum(w.*P(i,:));
end
