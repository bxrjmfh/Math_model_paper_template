function y = a1(data_1,data_2)
    % 合约性
    % data_1 订货量
    % data_2 供货量
    y = zeros(1,402);
    for num = 1:402 %遍历402家供货商
        data1 = data_1(num,:);
        data2 = data_2(num,:);
        index = find(data1>0); 
        n = length(index);
        C = zeros(1,n);
        for i = 1:n
            if data1(index(i)) > data2(index(i))
                C(i) = 0;
            elseif data1(index(i)) == data2(index(i))
                C(i) = 1;
            else
                C(i) = 0.8;
            end
        end
        y(num) = sum(C)/n;
    end
end