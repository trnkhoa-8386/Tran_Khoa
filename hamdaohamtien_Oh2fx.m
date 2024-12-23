function result = hamdaohamtien_Oh2fx(f, h, order, x_value)
    result = (f(x_value + 2*h) - 2*f(x_value + h) + f(x_value)) / h^order;
end