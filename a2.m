function y = a2(data_1,data_2)
    % 供货稳定性
    y = zeros(1,402);
    for num = 1:402 % 遍历供货商
        data1 = data_1(num,:);
        data2 = data_2(num,:);
        m = zeros(1,240);
        m(data1>0 & data2-data1>=0) = 1;
        l = 0;
        Max = 0;
        if m(1) == 1
            l = 1;
        end
        for i = 2:240
            if m(i-1) == 1 && m(i) == 1
                l = l + 1;
            elseif m(i-1) == 0 && m(i) == 1
                l = 1;
            elseif m(i-1) == 1 && m(i) == 0
                if Max < l
                    Max = l;
                end
            else
                l = 0;
            end
        end
        y(num) = Max;
    end
end