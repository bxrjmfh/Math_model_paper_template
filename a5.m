function y = a5(data_1,data_2)
    % 库存保障
    y = zeros(1,402);
    for num = 1:402 % 遍历供货商
        data1 = data_1(num,:); % 订货量
        data2 = data_2(num,:); % 供货量
        h = zeros(241,1);
        H = zeros(240,1);
        d = data2-data1;
        for w = 1:240
            h(w) = sum(d(1:w));
        end
        for w = 1:240
            if h(w)>=0 && h(w+1)>=0
                H(w) = 1;
            end
        end
        y(num) = sum(H)/240;
    end
end