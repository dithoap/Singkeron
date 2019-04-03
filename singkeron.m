clc;
clear;
close all

filename = 'BY60M-4';
stressformat = '.xlsx'; %STRESS
strainformat = '.csv'; 
dic_time_offset = 1.5; %in seconds


[init1, out1] = readmyexcel(strcat(filename,strainformat)); %multiply by 100 to be in percent
init1 = 100*init1;
out1 = 100*out1;

%first plot - strain
fps = 2.2; %change here for DIC frame per second 


time_interval = 1/fps;
[numrow_out1, numcol_out1] = size(out1);
dic_time = 0:time_interval:(numrow_out1-1)*time_interval; %original value
dic_time = dic_time - dic_time_offset;
[n, num_dic_data] = size(dic_time);
sampling_time = 0:0.1:100; %x-point at which data will be interpolated


strainxx_interp = interp1(dic_time,out1(1:num_dic_data,1),sampling_time,'spline');
strainyy_interp = interp1(dic_time,out1(1:num_dic_data,2),sampling_time,'spline');
%until this point, DIC strain data have been filtered and sampled at
%intended sampling time (sampling_time). The same sampling time will be
%used to interpolate stress data as below.

subplot(3,2,1)
plot(dic_time,out1(1:num_dic_data,1),'o',sampling_time,strainxx_interp,':.'); hold on;
plot(dic_time,out1(1:num_dic_data,2),'o',sampling_time,strainyy_interp,':.');
title('Spline interpolation of DIC \epsilon_{xx} and \epsilon_{yy}');
xlabel('\bf{Time (s)}', 'FontSize', 14);
ylabel('\bf{\epsilon_{xx} and \epsilon_{yy} (%)}', 'FontSize', 14);

subplot(3,2,2)
plot(dic_time,out1(1:num_dic_data,1),'o',sampling_time,strainxx_interp,':.'); hold on;
plot(dic_time,out1(1:num_dic_data,2),'o',sampling_time,strainyy_interp,':.');
title('Spline interpolation of DIC \epsilon_{xx} and \epsilon_{yy}');
xlabel('\bf{Time (s)}', 'FontSize', 14);
ylabel('\bf{\epsilon_{xx} and \epsilon_{yy} (%)}', 'FontSize', 14);
axis([0 8 -0.5 0.5])

%this code below read excel/csv file from Instron machine.
%the data is read by readmyexcel.m file and filtered with Savitzky-Golay
%filter. Once filtered, the data is resampled/interpolated at the same
%sampling time as the DIC data.


[init2, out2] = readmyexcel(strcat(filename,stressformat)); %STRESS

%second format - stress
sigmayy_interp = interp1(out2(:,1),out2(:,5),sampling_time,'spline');
%until this point, DIC strain data have been filtered and sampled at
%intended sampling time (sampling_time). The same sampling time will be
%used to interpolate stress data as below.


subplot(3,2,3)
plot(out2(:,1),out2(:,5),'o',sampling_time,sigmayy_interp,':.');
title('Spline interpolation of Instron \sigma_{yy}');
xlabel('\bf{Time (s)}', 'FontSize', 14);
ylabel('\bf{Axial stress \sigma} (MPa)', 'FontSize', 14);

subplot(3,2,4)
plot(out2(:,1),out2(:,5),'o',sampling_time,sigmayy_interp,':.');
title('Spline interpolation of Instron \sigma_{yy}');
xlabel('\bf{Time (s)}', 'FontSize', 14);
ylabel('\bf{Axial stress \sigma} (MPa)', 'FontSize', 14);
axis([-0.5 1 -0.5 1])

FINData = transpose([sampling_time; strainxx_interp; strainyy_interp; sigmayy_interp]); 

subplot(3,2,5)
plot(strainyy_interp,sigmayy_interp,':.');
xlabel('\bf{\epsilon_{yy} (%)}', 'FontSize', 14);
ylabel('\bf{Axial stress \sigma} (MPa)', 'FontSize', 14);
axis([-0.5 10 -0.5 30])


subplot(3,2,6)
plot(strainyy_interp,sigmayy_interp,':.');
xlabel('\bf{\epsilon_{yy} (%)}', 'FontSize', 14);
ylabel('\bf{Axial stress \sigma} (MPa)', 'FontSize', 14);
axis([-0.5 1 -0.5 10])

x0=700;
y0=50;
width=800;
height=700;
set(gcf,'units','points','position',[x0,y0,width,height])

delete(strcat(filename,'_synced.xlsx')); %make sure delete the file bfore creating file with same name

col_header = {'Time (s)', 'StrainXX (%)', 'StrainYY (%)', 'StressYY (MPa)'}; %Row cell array (for column labels)
xlswrite(strcat(filename,'_synced.xlsx'),FINData,'Sheet1','A2');     %Write data
xlswrite(strcat(filename,'_synced.xlsx'),col_header,'Sheet1','A1');     %Write column header