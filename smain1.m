%% 问题二敏感性分析
% 高钾玻璃

data = readmatrix('高钾玻璃.xlsx');

idx = [4,6,8,7,11];

d = data(:,idx);
for i = 1:5
    d1 = d;
    d1(:,i) = d(:,i).*0.9; 
    writematrix(d1,strcat(num2str(i),'_-0.1.xlsx'),'WriteMode','append');
end