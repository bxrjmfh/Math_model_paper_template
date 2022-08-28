function Y = YY(user)
    % 根据是否违约确定Y
    if user.breach == 0
        Y = 1;
    elseif user.breach == 1
        Y = -1;
    end
end