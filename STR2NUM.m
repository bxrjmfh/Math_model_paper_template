%% 量化表单1

D = zeros(58,4);
for i = 1:58
    d = data1(i,:);
    if d(2) == 'A'
        D(i,1) = 1;
    elseif d(2) == 'B'
        D(i,1) = 2;
    else
        D(i,1) = 3;
    end
    if d(3) == "高钾"
        D(i,2) = 1;
    elseif d(3) == "铅钡"
        D(i,2) = 0;
    end
    if d(4) == "黑"
        D(i,3) = 1;
    elseif d(4) == "蓝绿"
        D(i,3) = 2;
    elseif d(4) == "绿"
        D(i,3) = 3;
    elseif d(4) == "浅蓝"
        D(i,3) = 4;
    elseif d(4) == "浅绿"
        D(i,3) = 5;
    elseif d(4) == "深蓝"
        D(i,3) = 6;
    elseif d(4) == "深绿"
        D(i,3) = 7;
    elseif d(4) == "紫"
        D(i,3) = 8;
    else 
        D(i,3) = 0;
    end
    if d(5) == "风化"
        D(i,4) = 1;
    elseif d(5) == "无风化"
        D(i,4) = 0;
    end
end