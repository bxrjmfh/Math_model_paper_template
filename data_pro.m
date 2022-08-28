%% 数据预处理  
% 元胞数组 元胞数组内部存储结构体

clear;clc;
data_path_1 = 'C:\Users\ASUS\Desktop\第四次模拟赛\data\data1_1.csv'; 
data_path_2 = 'C:\Users\ASUS\Desktop\第四次模拟赛\data\data1_2.csv'; 
data_path_3 = 'C:\Users\ASUS\Desktop\第四次模拟赛\data\data1_3.csv';
output_path = 'C:\Users\ASUS\Desktop\第四次模拟赛\output data';
data_1 = readmatrix(data_path_1,'OutputType','string'); % 公司基本信息
data_out = readmatrix(data_path_2,'OutputType','string'); % 进项发票信息
data_in = readmatrix(data_path_3,'OutputType','string'); % 销项发票信息

data = cell(1,height(data_1)-1); % 目标元胞数组

for n = 2:height(data_1) %获取公司数
    user = struct;
    user.num_str = data_1(n,1);
    num_str = data_1(n,1);
    user.num = n - 1; % 代号
    user.name = data_1(n,2); % 公司名
    user.level = data_1(n,3); % 公司评级
    if data_1(n,4) == '否' 
        user.breach = 0; % 违约词条
    else 
        user.breach = 1;
    end
    index_out = find(data_out(:,1)==num_str);
    index_in = find(data_in(:,1)==num_str);
    out_mat = zeros(length(index_out),7); % 进项发票也就是出去的钱款
    in_mat = zeros(length(index_in),7); % 销项发票也就是进账的钱款
    out_mat(:,1) = str2double(data_out(index_out,2)); % 发票编号
    out_mat(:,2) = datenum(data_out(index_out,3)); % 日期序列号
    out_mat(:,3) = str2double(strrep(data_out(index_out,4),'A','1'));
    out_mat(:,4:6) = str2double(data_out(index_out,5:7));
    index = data_out(index_out,8) == '有效发票';
    out_mat(:,7) = index;
    user.out = out_mat;
    
    in_mat(:,1) = str2double(data_in(index_in,2)); % 发票编号
    in_mat(:,2) = datenum(data_in(index_in,3)); % 日期序列号
    in_mat(:,3) = str2double(strrep(data_in(index_in,4),'B','2'));
    in_mat(:,4:6) = str2double(data_in(index_in,5:7));
    index = data_in(index_in,8) == '有效发票';
    in_mat(:,7) = index;
    user.in = in_mat;
    data{n-1} = user;
    disp(n-1);
end
save(strcat(output_path,'\data1.mat'),"data")