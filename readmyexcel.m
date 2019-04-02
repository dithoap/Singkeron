function [myinitdata,newdata_filtered] = readmyexcel(filename)
%this function reads excel data and csv data and performed necessary filter
%using Savitzky Golay filter.
%The output is the initial data read from excel/csv and the filtered data.
%filename = 'BY60M-1.xlsx';
rawdata = xlsread(filename);
[rownum, colnum] = size(rawdata);

[~, ~, fExt] = fileparts(filename);
switch lower(fExt)
  case '.csv'
    golaylen = 21;
    %datastartatrow = 12-4;
    %rownum = rownum-datastartatrow + 1;
    %rawdata = rawdata(datastartatrow:end,:);
  case '.xlsx'
    golaylen = 101;
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

