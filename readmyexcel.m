function [myinitdata,newdata_filtered] = readmyexcel(filename)
%UNTITLED2 Summary of this function goes here
%Detailed explanation goes here
%%%%%%read raw data%%%%%%%%%%
%filename = 'a.csv';
rawdata = xlsread(filename);
[rownum, colnum] = size(rawdata);

[~, ~, fExt] = fileparts(filename);
switch lower(fExt)
  case '.csv'
    golaylen = 1501;
    datastartatrow = 12-4;
    rownum = rownum-datastartatrow + 1;
    rawdata = rawdata(datastartatrow:end,:);
  case '.xlsx'
    golaylen = 25;
  otherwise  % Under all circumstances SWITCH gets an OTHERWISE!
    error('Unexpected file extension: %s', fExt);
end


myinitdata = zeros(rownum,colnum);
newdata_filtered = zeros(rownum,colnum);

for i=1:colnum
    myinitdata(:,i) = rawdata(:,i);
    newdata_filtered(:,i) = sgolayfilt(rawdata(:,i),2,golaylen); 
end

end

