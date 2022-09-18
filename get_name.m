function n = get_name(d)
    % 分辨大类
    load('can.mat')
    % 高钾玻璃 1
    % 铅钡玻璃 0
    p(g) = d(g)<c(g);
    p(f) = d(f)>c(f);
    p = p.*DD;
    n = sum(p);
end