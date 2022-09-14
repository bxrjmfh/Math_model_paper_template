function y = a4(data_1)
    % 友好性
    y = zeros(1,402);
    for num = 1:402 % 遍历供货商
        y(num) = sum(data_1(num,:)>0)/240;
    end
end