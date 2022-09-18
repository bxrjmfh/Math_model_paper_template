%% 对表单三中的数据进行处理

clc
clear

data = readmatrix('表单3.csv');
data(:,1:2) = [];

big_type = strings(8,1);
small_type = strings(8,1);

for num = 1:8
    d = data(num,1:14);
    wind = data(num,15);
    if wind == 1
        % 还原数据
        d1 = get_back1(d); % 假设是高钾玻璃，进行还原
        d2 = get_back2(d); % 假设是铅钡玻璃，进行还原
        % 判别打分 
        s(1) = get_name(d1);
        s(2) = get_name(d2);
        if s(1) > 0.5 && s(2) > 0.5
            big_type(num) = "高钾玻璃";
        elseif s(2) < 0.5 && s(1) < 0.5
            big_type(num) = "铅钡玻璃";
        elseif s(1) > 0.5 && s(2) <0.5
            if 1-s(1) < s(2)
                big_type(num) = "高钾玻璃";
            else
                big_type(num) = "铅钡玻璃";
            end
        else
            big_type(num) = "wrong";
        end
    else
        % 无需还原
        S = get_name(d);
        if S>0.5
            big_type(num) = "高钾玻璃";
        else
            big_type(num) = "铅钡玻璃";
        end
    end
    
    if wind == 0
        if big_type(num) == "高钾玻璃" 
            small_type(num) = get_name1(d);
        elseif big_type(num) == "铅钡玻璃"
            small_type(num) = get_name2(d);
        else
            small_type(num) = "wrong";
        end
    else
        if big_type(num) == "高钾玻璃" 
            small_type(num) = get_name1(d1);
        elseif big_type(num) == "铅钡玻璃"
            small_type(num) = get_name2(d2);
        end
    end
end