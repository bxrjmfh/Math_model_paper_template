%% 问题二敏感性分析
% 高钾玻璃

data = readmatrix('铅钡玻璃.xlsx');

idx = [6,4,8,11,2];

d = data(:,idx);
for i = 1:5
    d1 = d;
    d1(:,i) = d(:,i).*1.1;
    writematrix(d1,strcat(num2str(i),'.xlsx'),'WriteMode','append');
end