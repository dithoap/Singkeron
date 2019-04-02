clc;
clear;
close all


[init1, out1] = readmyexcel('a.csv');
[init2, out2] = readmyexcel('a.xlsx');

figure;
plot(init2(:,1),init2(:,2),'*');
xlabel('x1 (mm)');
ylabel('y1 (N/mm)');
hold on;

plot(out2(:,1),out2(:,2),'-');
xlabel('x1 (mm)');
ylabel('y1 (N/mm)');

figure;
plot(init1(:,2),init1(:,3),'*');
xlabel('x1 (mm)');
ylabel('y1 (N/mm)');
hold on;

plot(out1(:,2),out1(:,3),'-');
xlabel('x1 (mm)');
ylabel('y1 (N/mm)');
