function y = x4(user)
    % 信誉等级的量化
    if user.level == 'A' 
        y = 1;
    elseif user.level == 'B'
        y = 0.75;
    elseif user.level == 'C'
        y = 0.5;
    elseif user.level == 'D'
        y = 0; % 原则上不借款
    end
end