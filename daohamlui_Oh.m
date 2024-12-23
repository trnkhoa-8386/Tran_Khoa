function result = daohamlui_Oh( x_data, y_data, h, x_interpolate)

    [~, idx] = min(abs(x_data - x_interpolate));

    if idx == 1 || idx == length(x_data)
        error('Giá trị cần tính đạo hàm phải nằm giữa các điểm dữ liệu.');
    end

    result = (y_data(idx) - y_data(idx - 1)) / h;
end
