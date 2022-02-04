%% Initialization
% dataset = readmatrix('test_dataset');
% opts = detectImportOptions('test_dataset.xlsx');
% preview('test_dataset.xlsx',opts)
% opts.Sheet = '2020'
% opts.SelectedVariableNames = {'new_cases_pct'}
% dataset = readmatrix('test_dataset');

%% Initialization
%clear all;
close all;

%%  Since Start of COVID; summary plot
figure('Name','Plot Summary of COVID Cases');
subplot(3,3,1); plot(ChinaNewCases); title('China New Cases');
subplot(3,3,2); plot(PhNewCases); title('Ph New Cases');
subplot(3,3,3); plot(IndiaNewCases); title('India New Cases');

subplot(3,3,4); plot(ChinaNewCasesPct); title('% Change');
subplot(3,3,5); plot(PhNewCasesPct); title('% Change');
subplot(3,3,6); plot(IndiaNewCasesPct); title('% Change');

%% Cross Correlations
[C1, lag1] = xcorr(PhNewCasesPct,ChinaNewCasesPct);
[C2, lag2] = xcorr(PhNewCasesPct,IndiaNewCasesPct);
[C3, lag3] = xcorr(ChinaNewCasesPct,IndiaNewCasesPct);

figure('Name','PH vs. China New Cases Cross Correlation');
C1_New = C1./max(abs(C1(:)));
plot(lag1,C1_New);

figure('Name','PH vs. India New Cases Cross Correlation');
C2_New = C2./max(abs(C2(:)));
plot(lag2,C2_New);

figure('Name','China vs. India New Cases Cross Correlation');
C3_New = C3./max(abs(C3(:)));
plot(lag3,C3_New);

%% 2021 to Current
PhNewCases2021 = PhNewCases(347:end,:);
PhNewCasesPct2021 = PhNewCasesPct(347:end,:);

ChinaNewCases2021 = ChinaNewCases(347:end,:);
ChinaNewCasesPct2021 = ChinaNewCasesPct(347:end,:);

IndiaNewCases2021 = IndiaNewCases(347:end,:);
IndiaNewCasesPct2021 = IndiaNewCasesPct(347:end,:);

%Cross Correlations
[C4, lag4] = xcorr(PhNewCasesPct2021,ChinaNewCasesPct2021);
[C5, lag5] = xcorr(PhNewCasesPct2021,IndiaNewCasesPct2021);
[C6, lag6] = xcorr(ChinaNewCasesPct2021,IndiaNewCasesPct2021);

figure('Name','PH vs. China New Cases Cross Correlation 2021');
C4_New = C4./max(abs(C4(:)));
plot(lag4,C4_New);

figure('Name','PH vs. India New Cases Cross Correlation 2021');
C5_New = C5./max(abs(C5(:)));
plot(lag5,C5_New);

figure('Name','China vs. India New Cases Cross Correlation 2021');
C6_New = C6./max(abs(C6(:)));
plot(lag6,C6_New);








%% Table Comparisons
% figure('Name','PH vs. China Raw New Cases');
% plot(ChinaNewCases); hold on; plot(PhNewCases); hold off; 
% legend('China','Ph');

%%
% 
% [rho,pval] = corr(phnewcasespct,chinanewcasespct,'type','Spearman');
% 
% b1 = phnewcasespct/chinanewcasespct;
% figure(6); scatter(phnewcasespct,chinanewcasespct);