close all
clc
if exist('PD_histo') ~= 1
    uiopen('*.mat');
end

%% Plot
t = cell2mat(PD_histo(2:end,1));
Q = abs(cell2mat(PD_histo(2:end,2)));
PH = cell2mat(PD_histo(2:end,3));
tsin = 0:0.001*pi:2*pi;

f = sin(tsin);
PH2 = PH.*2*pi;

% hold on
% yyaxis left

% plot(PH2,Q,'LineStyle','none','Marker','o','MarkerSize',0.5)
scatter_density = ceil(length(PH)/500);
[values, centers] = hist3([PH2 Q],'Nbins',[scatter_density scatter_density*5]);
% [values, centers] = hist3([PH2 Q],'CDataMode','auto');
% imagesc(centers{1},centers{2},values');
% contour(centers{1},centers{2},values','Fill','on')
histogram2(PH2, Q,500,'DisplayStyle','tile','ShowEmptyBins','on');
% pcolor(PH2, Q,values);
colormap(flipud(bone));
cb = colorbar();
set(gca,'ColorScale','log')
yyaxis left
set(gca, 'YScale', 'log')
grid minor
hold on
% scatter(PH2,Q,1,'.','MarkerFaceAlpha',.2,'MarkerEdgeAlpha',.2)
ylim([0.1e-12 10e-9])
yyaxis right
plot(tsin,f)



