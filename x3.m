function y = x3(user)
    %上下游企业数量
    y = length(unique(user.in(:,3))) + length(unique(user.out(:,3)));
end