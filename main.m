%% 输出判别是否借贷的矩阵

clear;clc;
answer = zeros(123,2); % P 是否借贷 1 0 
output_path = 'C:\Users\ASUS\Desktop\第四次模拟赛\output data';
load('data.mat') % 获得包含123个有贷款历史的用户信息的元胞数组data
index = 1;
for i = 1:123
    user = data{i};
    if user.level == 'D'
        answer(i,1) = 0;
        answer(i,2) = 0; % 不借贷
        P = 0;
    else 
        P = class1(user.x1,user.x2,user.x3,user.x4,user.x5);
        answer(i,1) = P;
        if P > 0.9098
            answer(i,2) = 1;    
        else
            answer(i,2) = 0;   
        end  
    end
    if user.breach == 1
        ss(index) = P;
        index = index + 1 ;
    end
end
save('answer.mat','answer')