%% 方差分析 颜色和风化

T = [2,9,0,12,1,0,4,2,4]; % A B C
n = [2,15,1,20,3,2,7,4,4];
r = 10;
dfA = r-1;
dfT = 58-1;
dfE = 58-r;
SSA = sum(T.^2./n)-sum(T)^2/sum(n);
SSE = sum(T) - sum(T.^2./n);
SST = SSA + SSE;
MSA = SSA/dfA;
MSE = SSE/dfE;
F = MSA / MSE;
