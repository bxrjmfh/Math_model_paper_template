%% 计算各企业每周供货量
clc;clear;

load("n_mat.mat")
load('D.mat')

B_mat = n_mat./D_mat;

save('B.mat','B_mat');