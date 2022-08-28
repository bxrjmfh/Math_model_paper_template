function Y = y(user)
    % 根据是否违约确定Y
    if user.breach == 0
        Y = 2.944;
    elseif user.breach == 1
        Y = -2.944;
    end
end