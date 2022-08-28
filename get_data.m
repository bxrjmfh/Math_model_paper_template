%% 主函数
%进行多元线性拟合

clear;clc;
data_path = 'C:\Users\ASUS\Desktop\第四次模拟赛\data\data1.mat';
output_path = 'C:\Users\ASUS\Desktop\第四次模拟赛\output data';
load(data_path) % 获得包含123个有贷款历史的用户信息的元胞数组data
answer = zeros(length(data),8); % Y P YY x1 x2 x3 x4 x5 
X = zeros(length(data),6);
X4 = zeros(length(data),1);

for i = 1:length(data)
    user = data{i};
    answer(i,:) = [y(user),1/(1+exp(-y(user))),YY(user),x1(user),x2(user),x3(user),x4(user),x5(user)];
    X(i,:) = [x1(user),x2(user),x3(user),x4(user),x5(user),YY(user)];
    X4(i,:) = x4(user);
    user.x1 = x1(user);
    user.x2 = x2(user);
    user.x3 = x3(user);
    user.x4 = x4(user);
    user.x5 = x5(user);
    data{i} = user;
end
index = find(X4 == 0);
X(index,:) = [];
answer(index,:) = [];

vector = answer; 
save('data.mat','data')
save(strcat(output_path,'\vector.mat'),"vector");