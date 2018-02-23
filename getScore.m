function out = getScore(cellin, xlsfile)
    %this function takes in a cell array and an xls filename and returns
    %the average column number of each cell array element in the xls file
    
    len = length(cellin);
    [~,~,top100k] = xlsread(xlsfile);
    runsum = 0;
    for i = 1:length(cellin)
        for j = 1:length(top100k)
            if isequal(lower(top100k{j}), lower(cellin{i}))
                runsum = runsum + j - 1;    %subtract 1 because of column header
                break
            end
            if j == length(top100k)
                len = len - 1;
            end
        end
    end
    for j = 1:length(cellin)
        if isempty(cellin{j})
            len = len - 1;
        end
    end
    if len == 0
        out = 0;
    else
        out = (runsum / len);
    end
end