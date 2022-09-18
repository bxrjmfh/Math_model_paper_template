%% 选出最佳拟合方式并绘制图像
% 高钾玻璃未风化

clc
clear

row = [];
col = [];

name_mat = ["二氧化硅(SiO2)","氧化钠(Na2O)","氧化钾(K2O)","氧化钙(CaO)","氧化镁(MgO)","氧化铝(Al2O3)","氧化铁(Fe2O3)","氧化铜(CuO)","氧化铅(PbO)","氧化钡(BaO)","五氧化二磷(P2O5)","氧化锶(SrO)","氧化锡(SnO2)","二氧化硫(SO2)"
];

for num = 1:length(row)
    x_idx = row(num);
    y_idx = col(num);
    x = data(:,x_idx);
    y = data(:,y_idx);
    R_mat = zeros(7,1); % 存储MSE
    beta_mat = zeros(7,2);

    modelfun1 = @(b,x)(b(1)+b(2).*x); % 线性拟合
    beta1 = [0.2,0.2]';%待定系数的预估值
    [beta_mat(1,:),~,~,~,~,~] = nlinfit(x,y,modelfun1,beta1); % 拟合
    [R_mat(1),~] = rsquare(y,modelfun1(beta_mat(1,:),x)); % 计算R方

    modelfun2 = @(b,x)(b(1).*x.^b(2));
    beta2 = [0.2,0.2]';%待定系数的预估值
    [beta_mat(2,:),~,~,~,~,~] = nlinfit(x,y,modelfun2,beta2);
    [R_mat(2),~] = rsquare(y,modelfun2(beta_mat(2,:),x)); % 计算R方

    modelfun3 = @(b,x)(b(1).*x.^(b(2).*x));
    beta3 = [0.2,0.2]';%待定系数的预估值
    [beta_mat(3,:),~,~,~,~,~] = nlinfit(x,y,modelfun3,beta3);%
    [R_mat(3),~] = rsquare(y,modelfun3(beta_mat(3,:),x));

    modelfun4 = @(b,x)(x./(b(1).*x+b(2)));
    beta4 = [0.2,0.2]';%待定系数的预估值
    [beta_mat(4,:),~,~,~,~,~] = nlinfit(x,y,modelfun4,beta4);%
    [R_mat(4),~] = rsquare(y,modelfun4(beta_mat(4,:),x));

    modelfun5 = @(b,x)(b(1)+b(2).*log(x));
    beta5 = [0.2,0.2]';%待定系数的预估值
    [beta_mat(5,:),~,~,~,~,~] = nlinfit(x,y,modelfun5,beta5);%
    [R_mat(5),~] = rsquare(y,modelfun5(beta_mat(5,:),x));

    modelfun6 = @(b,x)(b(1).*exp(b(2)./x));
    beta6 = [0.2,0.2]';%待定系数的预估值
    [beta_mat(6,:),~,~,~,~,~] = nlinfit(x,y,modelfun6,beta6);% 
    [R_mat(6),~] = rsquare(y,modelfun6(beta_mat(6,:),x));

    modelfun7 = @(b,x)(1./(b(1)+b(2).*exp(-x)));
    beta7 = [0.2,0.2]';%待定系数的预估值
    [beta_mat(7,:),~,~,~,~,~] = nlinfit(x,y,modelfun7,beta7);% 
    [R_mat(7),~] = rsquare(y,modelfun7(beta_mat(7,:),x));

    scatter(data(:,x_idx),data(:,y_idx),40,[44 170 253]./255,"filled")
    hold on
    [~,idx] = min(ones(4,1)-R_mat);wis
    if idx == 1
        plot(x,modelfun1(beta_mat(1,:),x),'Color',[38 204 216]./255,'LineWidth',1.6)
    elseif idx == 2
        plot(x,modelfun2(beta_mat(2,:),x),'Color',[38 204 216]./255,'LineWidth',1.6)
    elseif idx == 3
        plot(x,modelfun3(beta_mat(3,:),x),'Color',[38 204 216]./255,'LineWidth',1.6)
    elseif idx == 4
        plot(x,modelfun4(beta_mat(4,:),x),'Color',[38 204 216]./255,'LineWidth',1.6)
    elseif idx == 5
        plot(x,modelfun5(beta_mat(5,:),x),'Color',[38 204 216]./255,'LineWidth',1.6)
    elseif idx == 6
        plot(x,modelfun6(beta_mat(6,:),x),'Color',[38 204 216]./255,'LineWidth',1.6)
    else 
        plot(x,modelfun7(beta_mat(7,:),x),'Color',[38 204 216]./255,'LineWidth',1.6)
    end
    xlabel(strcat(name_mat(x_idx),'含量/%'),'FontName','宋体','FontSize',12,'FontWeight','bold')
    ylabel(strcat(name_mat(y_idx),'含量/%'),'FontName','宋体','FontSize',12,'FontWeight','bold','Color','black')
    title(strcat(name_mat(x_idx),'与',name_mat(y_idx),'拟合'),'FontName','宋体','FontSize',12,'FontWeight','bold')
    saveas(gcf, strcat(name_mat(x_idx),'与',name_mat(y_idx),'最佳拟合结果','.jpg'));
    hold off
end

