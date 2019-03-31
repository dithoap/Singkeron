%read p-delta curve
clc;
clear;
filename = 'W20S1.2#1.csv';
f = xlsread(filename);
separation=f(1:end,2);
force=f(1:end,3);
s=zeros(58,1);
for i=6:63
    for j=1:19188
        if abs(separation(j)-i)<0.002
            s(i-5)=force(j)
        end
    end
end
        