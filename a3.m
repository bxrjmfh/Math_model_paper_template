function y = a3(data_2,type)
    % 每周的平均供货量
    y = zeros(1,402);
    for num = 1:402 % 遍历供货商
        if type(num) == 'A'
            a = 1/0.6;
        elseif type(num) == 'B'
            a = 1/0.66;
        else
            a = 1/0.72;
        end
        y(num) = (sum(data_2(num,:))/240)*a;
    end
end