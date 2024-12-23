function [P, interpolated_value] = Newton_Interpolation(X, Y, xi)
    try
        if ischar(X)
            X = str2num(X);
        end
        if ischar(Y)
            Y = str2num(Y);
        end
        if ischar(xi)
            xi = str2double(xi);
        end
        
        if isempty(X) || isempty(Y) || isempty(xi)
            error('Dữ liệu đầu vào không hợp lệ');
        end
        
        if length(X) ~= length(Y)
            error('Độ dài của X và Y phải bằng nhau');
        end
        
        n = length(X);
        
        if size(Y, 1) == 1
            Y = Y(:);
        end
        
        divided_diff = zeros(n, n);
        divided_diff(:, 1) = Y;
        
        for j = 2:n
            for i = 1:(n-j+1)
                divided_diff(i, j) = (divided_diff(i+1, j-1) - divided_diff(i, j-1)) / (X(i+j-1) - X(i));
            end
        end
        
        syms x;
        P = sym(divided_diff(1, 1)); % Thành phần đầu tiên
        term = sym(1);
        
        for k = 1:(n-1)
            term = term * (x - X(k)); % Nhân với (x - x_k)
            P = P + divided_diff(1, k+1) * term; % Cộng thêm thành phần tiếp theo
        end
        
        P = simplify(P);
        
        interpolated_value = double(subs(P, x, xi));
        
        if isnan(interpolated_value) || isinf(interpolated_value)
            error('Kết quả nội suy không hợp lệ (NaN hoặc Inf)');
        end
        
    catch ME
        error('Lỗi nội suy Newton: %s', ME.message);
    end
end