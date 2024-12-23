function result = daohamlui_Oh2( x_data, y_data, h, x_interpolate)
    [~, idx] = min(abs(x_data - x_interpolate));
    if idx == 1 || idx == length(x_data)
        error('Giá trị cần tính đạo hàm phải nằm giữa các điểm dữ liệu.');
    end

    result = (-3*y_data(idx) + 4*y_data(idx-1) - y_data(idx-2)) / (2 * h);
end
