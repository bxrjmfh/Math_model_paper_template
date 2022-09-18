function data = get_back2(data)
    % 还原铅钡玻璃风化数据
    load("can3.mat")
    data = (data.*delta2 + data).*0.1 + 0.9.*(data.*delta22 + data);
    data = data./sum(data).*100; % 归一化
end