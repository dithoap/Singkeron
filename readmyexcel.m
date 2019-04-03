function [rawdata,newdata_filtered] = readmyexcel(filename)
%this function reads excel data and csv data and performed necessary filter
%using Savitzky Golay filter.
%The output is the initial data read from excel/csv and the filtered data.
%filename = 'BY60M-1.csv';
rawdata = xlsread(filename);
[rownum, colnum] = size(rawdata);

[~, ~, fExt] = fileparts(filename);
switch lower(fExt)
  case '.csv'
    golaylen = 21;
    %datastartatrow = 12-4;
    %rownum = rownum-datastartatrow + 1;
    %rawdata = rawdata(datastartatrow:end,:);
    filter_except = 0;
  case '.xlsx'
    golaylen = 101;
    filter_except = 1; %column to filter exception (time column not filtered)
  otherwise  % Under all circumstances SWITCH gets an OTHERWISE!
    error('Unexpected file extension: %s', fExt);
end


newdata_filtered = zeros(rownum,colnum);


for i=1:colnum
    if i ~= filter_except
    newdata_filtered(:,i) = sgolayfilt(rawdata(:,i),2,golaylen); 
    disp(['File ', filename, ' column no. ', num2str(i), ' was filtered']);
    else 
    newdata_filtered(:,i) = rawdata(:,1);
    disp(['File ', filename, ' column no. ', num2str(i), ' was NOT filtered']);
    end
end

end

