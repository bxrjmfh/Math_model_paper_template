%% 使用各组分均值的均值作为分界点 正确率98.44% 大类分割

clc;clear;

data1 = readmatrix('高钾玻璃.xlsx');
data2 = readmatrix("铅钡玻璃.xlsx");

data1 = data1(:,2:end);
data2 = data2(:,2:end);

c1 = sum(data1,1)./height(data1); %1 
c2 = sum(data2,1)./height(data2); %0

c = (c1+c2)/2; % 获得各组份分界点
index = c1>c;
g = find(index == 0);
f = find(index == 1);

delta = abs(c1-c2)./(c1+c2).*2;
delta = delta./sum(delta);

l1 = zeros(height(data1),1);
l2 = zeros(height(data2),1);

p = zeros(1,14);

% 验证正确率
for i = 1:height(data1)
    d = data1(i,:);
    p(g) = d(g)<c(g);
    p(f) = d(f)>c(f);
    p = p.*delta;
    l1(i) = sum(p)>0.5;
end
for i = 1:height(data2)
    d = data2(i,:);
    p(g) = d(g)<c(g);
    p(f) = d(f)>c(f);
    p = p.*delta;
    l2(i) = sum(p)>0.5;
end

correct = (sum(l1==1)+sum(l2==0))/(18+46); %计算分类正确率
