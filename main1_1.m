%% 第一种方案

clc
clear
load("ans.mat")
load('d.mat')

%研究高钾玻璃的变化率
delta1 = (mat1(3,:) - mat2(3,:))./mat2(3,:);
i = find(mat2(3,:)==0);
g = mat1(3,:);
delta1(i) = 0;

% d2 待还原数据 有6个数据待还原 

D2 = d2.*delta1 + d2;
D2(:,i) = mat1(3,i).*ones(6,length(i));

D2 = D2./sum(D2,2).*100; % 归一化

save('D2_ans1.mat','D2')
