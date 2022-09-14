%% 各企业交付率的估计

clear;clc;

load('data_1_50.mat')
load('data_2_50.mat')
D_mat = zeros(50,1);

for num = 1:50 % 遍历50家供货商
    index = find(data_1(num,:)>0); % 找到订单大于0的周数
    D_mat(num) = sum(data_2(num,index)./data_1(num,index))/length(index); % 企业交付率
end

save('D.mat','D_mat')