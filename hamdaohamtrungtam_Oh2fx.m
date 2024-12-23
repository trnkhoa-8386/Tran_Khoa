function result = hamdaohamtrungtam_Oh2fx(f, h, x_interpolate)
    result = (f(x_interpolate + h) - 2 * f(x_interpolate) + f(x_interpolate - h)) / h^2;
end