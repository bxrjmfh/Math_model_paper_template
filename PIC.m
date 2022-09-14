%% 打分排名绘图
clc;clear;

load("S.mat")
[B,index] = sort(S,'descend');

plot(B,'LineWidth',1.6,'Color',[130 176 210]/256);
xlabel('','FontName','宋体','FontSize',12,'FontWeight','bold')
ylabel('企业生产重要性指标','FontName','宋体','FontSize',12,'FontWeight','bold')
title('402家供货商重要性指标','FontName','宋体','FontSize',12,'FontWeight','bold')