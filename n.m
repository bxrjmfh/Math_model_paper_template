%% 对各企业供应量的期望
clc;clear;
L0 = 0.133; % 平均损耗率
load('C.mat')
load('type_50.mat')

N = zeros(1,24);
c = c(:,1:24);
n_mat = zeros(50,24);
N(1:2) = 2.82*1e4*2/(1-L0);
N(3:end) = 2.82*1e4/(1-L0);
k_mat = zeros(50,1);

for num = 1:50
    if type(num) == 'A'
        k_mat(num) = 1/0.6;
    elseif type(num) == 'B'
        k_mat(num) = 1/0.66;
    else
        k_mat(num) = 1/0.72;
    end
end

for w= 1:24
    n_mat(:,w) = N(w).*(c(:,w))./sum(c(:,w).*k_mat);
end

save('n_mat.mat','n_mat')