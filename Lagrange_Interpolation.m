function [P, interpolated_value] = Lagrange_Interpolation(X, Y, xi)
    try
        % Chuyển đổi input string sang numeric array
        if ischar(X)
            X = str2num(X);
        end
        if ischar(Y)
            Y = str2num(Y);
        end
        if ischar(xi)
            xi = str2double(xi);
        end
        
        % Kiểm tra dữ liệu đầu vào
        if isempty(X) || isempty(Y) || isempty(xi)
            error('Dữ liệu đầu vào không hợp lệ');
        end
        
        if length(X) ~= length(Y)
            error('Độ dài của X và Y phải bằng nhau');
        end
        
        % Số lượng điểm nội suy
        n = length(X);
        
        % Khởi tạo biến symbolic cho đa thức nội suy
        syms x;
        P = sym(0);
        
        % Tính đa thức Lagrange
        for i = 1:n
            % Tính hệ số L_i(x) cho từng điểm
            L = sym(1);
            for j = 1:n
                if i ~= j
                    L = L * (x - X(j))/(X(i) - X(j));
                end
            end
            P = P + Y(i) * L;
        end
        
        % Đơn giản hóa đa thức kết quả
        P = simplify(P);
        
        % Tính giá trị nội suy tại điểm xi
        interpolated_value = double(subs(P, x, xi));
        
        % Kiểm tra kết quả có hợp lệ
        if isnan(interpolated_value) || isinf(interpolated_value)
            error('Kết quả nội suy không hợp lệ (NaN hoặc Inf)');
        end
        
    catch ME
        error('Lỗi nội suy: %s', ME.message);
    end
end