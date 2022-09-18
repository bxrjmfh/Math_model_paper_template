%% 方差分析 玻璃种类和风化

T = [6,28]; % 高钾 铅钡
n = [18,40];
r = 2;
dfA = r-1;
dfT = 58-1;
dfE = 58-r;
SSA = sum(T.^2./n)-sum(T)^2/sum(n);
SSE = sum(T) - sum(T.^2./n);
SST = SSA + SSE;
MSA = SSA/dfA;
MSE = SSE/dfE;
F = MSA / MSE;
