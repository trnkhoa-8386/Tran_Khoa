function result = daohamtien_Oh(x_data, y_data, h, order, x_value)
    if ischar(x_data)
        x_data = str2num(x_data);
    end
    if ischar(y_data)
        y_data = str2num(y_data);
    end
    
    x_data = x_data(:);
    y_data = y_data(:);
    
    if length(x_data) ~= length(y_data)
        error('Độ dài của x_data và y_data phải bằng nhau');
    end
    if length(x_data) < 3
        error('Cần ít nhất 3 điểm dữ liệu để tính đạo hàm');
    end
    
    [~, index] = min(abs(x_data - x_value));
    n = length(x_data);
    
    if index == 1
        result = (-y_data(index + 2) + 4*y_data(index + 1) - 3*y_data(index)) / (2*h);
    elseif index == n
        result = (3*y_data(index) - 4*y_data(index - 1) + y_data(index - 2)) / (2*h);
    else
        result = (y_data(index + 1) - y_data(index - 1)) / (2*h);
    end
end
