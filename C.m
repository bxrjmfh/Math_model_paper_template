%% 各企业每周供应能力大小评估
clc;clear;

load('data_2_50.mat')
answer_mat = zeros(50,48);

x = 1:5;

for num = 1:50 % 遍历企业
    for w = 1:48 % 遍历生产周
        y = data_2(num,[w,w+48,w+48*2,w+48*3,w+48*4]); % 获得数据
        a = sum(y)/5; % 计算预测值
        answer_mat(num,w) = a; 
    end
end
c = answer_mat;
save('C.mat','c');