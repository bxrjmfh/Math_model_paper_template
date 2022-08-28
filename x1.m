function y = x1(user)
    % 求解企业的利润率
    index_in = find(user.in(:,7) == 1); %获得有效发票的index
    index_out = find(user.out(:,7) == 1);
    y = (sum(user.in(index_in,6))-sum(user.out(index_out,6)))/(sum(user.out(index_out,6)));
end