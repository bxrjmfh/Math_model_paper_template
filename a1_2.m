%% 方差分析 纹饰和风化

T = [11,6,17]; % A B C
n = [22,6,30];
r = 3;
dfA = r-1;
dfT = 58-1;
dfE = 58-r;
SSA = sum(T.^2./n)-sum(T)^2/sum(n);
SSE = sum(T) - sum(T.^2./n);
SST = SSA + SSE;
MSA = SSA/dfA;
MSE = SSE/dfE;
F = MSA / MSE;
