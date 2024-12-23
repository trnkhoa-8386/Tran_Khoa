function result = daohamtien_Oh2(x_data, y_data, h, order, x_value)
    if ischar(x_data)
        x_data = str2num(x_data);
    end
    if ischar(y_data)
        y_data = str2num(y_data);
    end
    
    % Chuyển đổi thành vector cột
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
        result = (-y_data(index + 3) + 4*y_data(index + 2) - 5*y_data(index + 1) + 2*y_data(index)) / (h^2);
    elseif index == n
        result = (2*y_data(index) - 5*y_data(index - 1) + 4*y_data(index - 2) - y_data(index - 3)) / (h^2);
    else
        result = (y_data(index + 1) - 2*y_data(index) + y_data(index - 1)) / (h^2);
    end
end