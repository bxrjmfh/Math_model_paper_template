%% 运输损耗率估计

load('transport.mat')

index = find(transport>0);

L0 = sum(transport(index)/length(index))*0.01;