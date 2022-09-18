function data = get_back1(data)
    % 还原高钾玻璃风化数据
    load("can2.mat")
    data = data.*delta1 + data;
    data(HH) = data(HH) + mat1;
    data = data./sum(data).*100; % 归一化
end