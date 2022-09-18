%% 找出四种类型 注意剔除不合理数据 数据最后一列表示是否需要剔除

clc;clear;

load("data1.mat")
load('data2.mat')
load('data2_mat.mat')

index1 = []; %高钾玻璃 未风化
index2 = []; %高钾玻璃 风化
index3 = []; %高钾玻璃 严重风化
index4 = []; %铅钡玻璃 未风化
index5 = []; %铅钡玻璃 风化 
index6 = []; %铅钡玻璃 严重风化 

G = data2(:,1);
g = str2double(G);

for I = 1:length(g)
    i = g(I);
    if ~isnan(i) % 有效数据 
        if data1(i,3) == "高钾"
            if data1(i,5) == "无风化"
                index1(end+1) = I;
            elseif data1(i,5) == "风化"
                index2(end+1) = I;
            end
        elseif data1(i,3) == "铅钡"
            if data1(i,5) == "无风化"
                index4(end+1) = I;
            elseif data1(i,5) == "风化"
                index5(end+1) = I;
            end
        end
    end
end

