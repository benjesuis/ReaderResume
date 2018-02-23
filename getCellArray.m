function cellArray = getCellArray(string)
    %this function takes in a string representing a file location and
    %returns every word (only using letters) in a cell array
    %ie each word has its own cell

    fid=fopen(string);
    if fid == -1
        disp('File cannot be opened')
    else 
        output=textscan(fid,'%s');
    end
    cellArray=lower(output{:,1});
    [r, ~]=size(cellArray);
    for i=1:r
        checkString=double(cellArray{i,1});
        for j=length(checkString):-1:1
            if checkString(j) < 97 || checkString(j) > 122
                checkString(j)=[];
                cellArray{i,1}=char(checkString);
            end
        end
    end
end
