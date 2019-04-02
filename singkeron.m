clc;
clear;
close all

filename = 'BY60M-1';
stressformat = '.xlsx'; %STRESS
strainformat = '.csv'; 

[init1, out1] = readmyexcel(strcat(filename,strainformat)); 
[init2, out2] = readmyexcel(strcat(filename,stressformat)); %STRESS

%first plot - strain
fps = 2.0; %change here for DIC frame per second 


time_interval = 1/fps;
[numrow_out1, numcol_out1] = size(out1);
dic_time = 0:time_interval:(numrow_out1-1)*time_interval; %original value
[n, num_dic_data] = size(dic_time);
sampling_time = 0:1:100; %x-point at which data will be interpolated


strainxx_interp = interp1(dic_time,out1(1:num_dic_data,1),sampling_time,'spline');
strainyy_interp = interp1(dic_time,out1(1:num_dic_data,2),sampling_time,'spline');

figure
plot(dic_time,out1(1:num_dic_data,1),'o',sampling_time,strainxx_interp,':.');
title('(Default) Linear Interpolation');


figure
vq1 = interp1(x,v,xq, 'spline');
plot(x,v,'o',xq,vq1,':.');
xlim([0 2*pi]);
title('(Default) Linear Interpolation');

figure;
plot(init1(:,2),init1(:,3),'*');
hold on;

plot(out1(:,2),out1(:,3),'-');
xlabel('\bf{\epsilon_{xx} (%)}', 'FontSize', 14);
ylabel('\bf{\epsilon_{yy} (%)}', 'FontSize', 14);

%second format - stress
figure;
plot(init2(:,1),init2(:,2),'*');
hold on;
plot(out2(:,1),out2(:,2),'-');
xlabel('\bf{Time (s)}', 'FontSize', 14);
ylabel('\bf{Axial stress \sigma} (MPa)', 'FontSize', 14);



