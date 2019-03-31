clc;
clear;
%%%%%%read raw data%%%%%%%%%%
filename = 'W20s0#1.xlsx';
f = xlsread(filename);
separation{1}=f(1:53,1);
force{1}=f(1:53,2);
a{1}=f(1:53,3);
%%%%%%smoothing%%%%%%%%%%%%%%
forces=sgolayfilt(force{1},2,19);
as=sgolayfilt(a{1},2,19);
%%%%%%%%%%%%%%%%get n%%%%%%%%%
C{1}=separation{1}./forces;
x=log(as);
y=log(C{1});
p = polyfit(x,y,1);
y1=p(1)*x+p(2);
% plot(x,y,'*');
% hold on;
% plot(x,y1);
n=p(1);
Gc=n*forces.*separation{1}/2/20.6./(as);
figure;
plot(as,Gc,'*');
xlabel('crack length (mm)');
ylabel('G_C (N/mm)');
hold on;

%%%%%%read raw data%%%%%%%%%%
filename = 'W20s0#2.xlsx';
f = xlsread(filename);
separation{6}=f(1:56,1);
force{6}=f(1:56,2);
a{6}=f(1:56,3);
%%%%%%smoothing%%%%%%%%%%%%%%
forces=sgolayfilt(force{6},2,19);
as=sgolayfilt(a{6},2,19);
%%%%%%%%%%%%%%%%get n%%%%%%%%%
C{6}=separation{6}./forces;
x=log(as);
y=log(C{6});
p = polyfit(x,y,1);
y1=p(1)*x+p(2);
% plot(x,y,'*');
% hold on;
% plot(x,y1);
n=p(1);
Gc=n*forces.*separation{6}/2/20.6./(as);
plot(as,Gc,'*');
hold on;

%%%%%%read raw data%%%%%%%%%%
filename = 'W20s0.2#1.xlsx';
f = xlsread(filename);
separation{7}=f(2:49,1);
force{7}=f(2:49,2);
a{7}=f(2:49,3);
%%%%%%smoothing%%%%%%%%%%%%%%
forces=sgolayfilt(force{7},2,19);
as=sgolayfilt(a{7},2,19);
%%%%%%%%%%%%%%%%get n%%%%%%%%%
C{7}=separation{7}./forces;
x=log(as);
y=log(C{7});
p = polyfit(x,y,1);
y1=p(1)*x+p(2);
% plot(x,y,'*');
% hold on;
% plot(x,y1);
n=p(1);
Gc=n*forces.*separation{7}/2/20.3./(as);
plot(as,Gc,'.');
hold on;

%%%%%%read raw data%%%%%%%%%%
filename = 'W20s0.2#2.xlsx';
f = xlsread(filename);
separation{2}=f(2:70,1);
force{2}=f(2:70,2);
a{2}=f(2:70,3);
%%%%%%smoothing%%%%%%%%%%%%%%
forces=sgolayfilt(force{2},2,19);
as=sgolayfilt(a{2},2,19);
%%%%%%%%%%%%%%%%get n%%%%%%%%%
C{2}=separation{2}./forces;
x=log(as);
y=log(C{2});
p = polyfit(x,y,1);
y1=p(1)*x+p(2);
% plot(x,y,'*');
% hold on;
% plot(x,y1);
n=p(1);
Gc=n*forces.*separation{2}/2/20.6./(as);
plot(as,Gc,'.');
hold on;

%%%%%%read raw data%%%%%%%%%%
filename = 'W20s0.8#1.xlsx';
f = xlsread(filename);
separation{4}=f(1:75,1);
force{4}=f(1:75,2);
a{4}=f(1:75,3);
%%%%%%smoothing%%%%%%%%%%%%%%
forces=sgolayfilt(force{4},2,19);
as=sgolayfilt(a{4},2,19);
%%%%%%%%%%%%%%%%get n%%%%%%%%%
C{4}=separation{4}./forces;
x=log(as);
y=log(C{4});
p = polyfit(x,y,1);
y1=p(1)*x+p(2);
% plot(x,y,'*');
% hold on;
% plot(x,y1);
n=p(1);
Gc=n*forces.*separation{4}/2/20.6./(as);
plot(as,Gc,'--');
hold on;


%%%%%%read raw data%%%%%%%%%%
filename = 'W20s1.0#1.xlsx';
f = xlsread(filename);
separation{3}=f(2:75,1);
force{3}=f(2:75,2);
a{3}=f(2:75,3);
%%%%%%smoothing%%%%%%%%%%%%%%
forces=sgolayfilt(force{3},2,19);
as=sgolayfilt(a{3},2,19);
%%%%%%%%%%%%%%%%get n%%%%%%%%%
C{3}=separation{3}./forces;
x=log(as);
y=log(C{3});
p = polyfit(x,y,1);
y1=p(1)*x+p(2);
% plot(x,y,'*');
% hold on;
% plot(x,y1);
n=p(1);
Gc=n*forces.*separation{3}/2/20.6./(as);
plot(as,Gc,':');
hold on;


%%%%%%read raw data%%%%%%%%%%
filename = 'W20s1.2#1.xlsx';
f = xlsread(filename);
separation{9}=f(2:58,1);
force{9}=f(2:58,2);
a{9}=f(2:58,3);
%%%%%%smoothing%%%%%%%%%%%%%%
forces=sgolayfilt(force{9},2,19);
as=sgolayfilt(a{9},2,19);
%%%%%%%%%%%%%%%%get n%%%%%%%%%
C{9}=separation{9}./forces;
x=log(as);
y=log(C{9});
p = polyfit(x,y,1);
y1=p(1)*x+p(2);
% plot(x,y,'*');
% hold on;
% plot(x,y1);
n=p(1);
Gc=n*forces.*separation{9}/2/20.3./(as);
plot(as,Gc,'-');
hold on;


%%%%%%read raw data%%%%%%%%%%
filename = 'W20s1.4#1.xlsx';
f = xlsread(filename);
separation{5}=f(1:49,1);
force{5}=f(1:49,2);
a{5}=f(1:49,3);
%%%%%%smoothing%%%%%%%%%%%%%%
forces=sgolayfilt(force{5},2,19);
as=sgolayfilt(a{5},2,19);
%%%%%%%%%%%%%%%%get n%%%%%%%%%
C{5}=separation{5}./forces;
x=log(as);
y=log(C{5});
p = polyfit(x,y,1);
y1=p(1)*x+p(2);
% plot(x,y,'*');
% hold on;
% plot(x,y1);
n=p(1);
Gc=n*forces.*separation{5}/2/20.6./(as);
plot(as,Gc,'-.');
hold on;



legend('\epsilon 0% - #1','\epsilon 0% - #2','\epsilon 0.2% - #1',...
    '\epsilon 0.2% - #1','\epsilon 0.8% - #1',...
    '\epsilon 1.0% - #1','\epsilon 1.2% - #1','\epsilon 1.4% - #1');