clc;clear;
cm = [[130 176 210]/255;[255 190 122]/255; [250 127 111]/255;];
colormap(cm);

A = [16,15,19];

labels = {'A','B','C'};
pie(A)
lgd = legend(labels);
title('50家最重要的供应商供货种类分布','FontName','宋体','FontSize',14,'FontWeight','bold')
