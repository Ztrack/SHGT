clc; clearvars;

[file1,path1] = uigetfile('*.csv','Select csv');
listData = readtable([path1 file1]);
%listData = readmatrix('SHGT Construction List - List.csv'); % data in matrix format for analyzing

listData = listData(:,1:3);
listStr = ['['];
for i = 1:size(listData,1)
    
    if char(listData{i,1}) == 'x'
        continue
    end

    if i ~= 1
        listStr = [ char(listStr) '"],'];
    end

      
    listStr = [ char(listStr) '["' char(listData{i,1}) '","' num2str(listData{i,2}) '","' char(listData{i,3})];
end

listStr = [ char(listStr) '"]]'];



%% Vehicle output

clc; clearvars;

[file1,path1] = uigetfile('*.csv','Select csv');
listData = readtable([path1 file1]);

listData = listData(:,1:3);
listStr = ['['];
for i = 1:size(listData,1)
    
    if char(listData{i,1}) == 'x'
        continue
    end

    if i ~= 1
        listStr = [ char(listStr) '"],'];
    end

      
    listStr = [ char(listStr) '["' char(listData{i,1}) '","' char(listData{i,2}) '","' num2str(listData{i,3})];
end

listStr = [ char(listStr) '"]]'];