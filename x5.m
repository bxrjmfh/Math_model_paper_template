function y = x5(user)
    % 每笔销进项的平均金额
    in = (user.in(:,6) > 0) & (user.in(:,7) == 1);
    out = (user.out(:,6) > 0) & (user.out(:,7) == 1);
    N = sum(in) + sum(out);
    n = sum(user.in(:,6).*in) + sum(user.out(:,6).*out);
    y = n / N; 
end