%% 第一种方案

clc
clear
load("ans.mat")
load('data2_mat.mat')
load('d.mat')
%研究铅钡玻璃的变化率 
delta2 = (mat3(3,:) - mat4(3,:))./mat4(3,:); % 均值变化率预测

% 引入正反数据预测

A = data2_mat(56:59,1:end-1);
delta22 = ((A(2,:)-A(1,:))./A(1,:)+(A(4,:)-A(3,:))./A(3,:))/2;
delta22(isnan(delta22)) = 0; 
D5 = (d5.*delta2 + d5).*0.7 + 0.3.*(d5.*delta22 + d5);

D5 = D5./sum(D5,2).*100; % 归一化

save('D5_ans1.mat','D5')