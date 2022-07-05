    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%滑窗线性检测
%处理空速
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function type_mat1 = TAS(data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %关键参数
    w = 10;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    velocity = data(:,11); %获得空速序列
    dvelocity = abs(diff(velocity));
    k_s = mean(dvelocity);
    delta_s = mean(dvelocity) * w;
    t = data(:,1); %获得时间序列  
    big_win_start = 1; %大小滑窗初始化
    big_win_end = 1+w;
    small_win_start = 1;
    small_win_end = 1+w;
    MAX_time_index = length(t);%序列长度
    index = 1;
    %1:上升 0:平稳 -1:下降 
    while small_win_end <= MAX_time_index %不断滑动检测小窗
        [p,~,~] = polyfit(t(small_win_start:small_win_end),velocity(small_win_start:small_win_end),1); %拟合小窗数据
        if small_win_start == big_win_start %初始化滑动窗
            if p(1) >= k_s
                Type = 1;
            elseif p(1) <= -k_s
                Type = -1;
            else
                Type = 0;
            end
            small_win_start = small_win_start + 1;
            small_win_end = small_win_end + 1;
            big_win_end = small_win_end;
        else
            if Type == 1
                if p(1) > 0 %前一刻和此刻都是上升
                    small_win_start = small_win_start + 1;
                    small_win_end = small_win_end + 1;
                    big_win_end = small_win_end;            
                else  %变号了，固定更新
                    type_mat(index) = 1;
                    index_mat(index) = big_win_end-1;
                    index = index + 1;
                    small_win_start = small_win_end;
                    small_win_end = small_win_start + w;
                    big_win_start = small_win_start;
                    big_win_end = small_win_end;
                    delta = 0;
                end
            elseif Type == -1
                if p(1) < 0 %前一刻和此刻都是下降
                    small_win_start = small_win_start + 1;
                    small_win_end = small_win_end + 1;
                    big_win_end = small_win_end;            
                else  %变号了，固定更新
                    type_mat(index) = -1;
                    index_mat(index) = big_win_end-1;
                    index = index + 1;
                    small_win_start = small_win_end;
                    small_win_end = small_win_start + w;
                    big_win_start = small_win_start;
                    big_win_end = small_win_end;
                    delta = 0;
                end
            else
                if abs(p(1)) >= k_s 
                    type_mat(index) = 0;
                    index_mat(index) = big_win_end-1;
                    index = index + 1;
                    small_win_start = small_win_end;
                    small_win_end = small_win_start + w;
                    big_win_start = small_win_start;
                    big_win_end = small_win_end;
                    delta = 0;            
                else 
                    delta = max(velocity(big_win_start:big_win_end))-min(velocity(big_win_start:big_win_end));
                    if abs(delta) >= delta_s
                        if delta > 0
                            type_mat(index) = 1;
                            index_mat(index) = big_win_end-1;
                            index = index + 1;
                            small_win_start = small_win_end;
                            small_win_end = small_win_start + w;
                            big_win_start = small_win_start;
                            big_win_end = small_win_end;
                            delta = 0;   
                        else
                            type_mat(index) = -1;
                            index_mat(index) = big_win_end-1;
                            index = index + 1;
                            small_win_start = small_win_end;
                            small_win_end = small_win_start + w;
                            big_win_start = small_win_start;
                            big_win_end = small_win_end;
                            delta = 0;
                        end
                    else
                        small_win_start = small_win_start + 1;
                        small_win_end = small_win_end + 1;
                        big_win_end = small_win_end; 
                    end
                end
            end
        end
    end
        
    type_mat(index) = Type; %保存最后一个状态
    index_mat(index) = MAX_time_index-2;
    type_mat1 = zeros('like',type_mat);
    type = type_mat(1);
    if type == 1
        type_mat1(1:index_mat(1)) = 1;
    elseif type == 0
        type_mat1(1:index_mat(1)) = 0;
    else
        type_mat1(1:index_mat(1)) = -1;
    end
    for l = 2:length(type_mat)
        type = type_mat(l);
        if type == 1
            type_mat1(index_mat(l-1):index_mat(l)) = 1;
        elseif type == 0
            type_mat1(index_mat(l-1):index_mat(l)) = 0;
        else
            type_mat1(index_mat(l-1):index_mat(l)) = -1;
        end
    end
    type_mat1 = type_mat1(1:MAX_time_index-2);
end
