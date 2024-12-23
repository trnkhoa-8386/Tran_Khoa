function result = hamdaohamtien_Ohfx(f, h, order, x_value)
    result = (f(x_value + h) - f(x_value - h)) / (2 * h^order);
end