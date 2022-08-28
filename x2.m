function y = x2(user)
    % 有效正交易占比
    num = height(user.in) + height(user.out); % 发票总数 
    num_2 = sum((user.in(:,6) > 0) & (user.in(:,7) == 1)) + sum((user.out(:,6) > 0) & (user.out(:,7) == 1));
    y = num_2 / num;
end