function result = daohamtrungtam_Oh(x_data, y_data, h, x_interpolate)
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
        error('Cần ít nhất 3 điểm dữ liệu để tính đạo hàm trung tâm');
    end
    
    [~, index] = min(abs(x_data - x_interpolate));
    n = length(x_data);
    
    if index == 1 || index == n
        error('Không thể tính đạo hàm trung tâm tại điểm đầu hoặc cuối của dãy');
    end
    
    result = (y_data(index + 1) - y_data(index - 1)) / (2 * h);
end