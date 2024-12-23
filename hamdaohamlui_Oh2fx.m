function result = hamdaohamlui_Oh2fx(f, h, x_interpolate)
    result = (-f(x_interpolate + 2*h) + 4*f(x_interpolate + h) - 3*f(x_interpolate)) / (2 * h);
end