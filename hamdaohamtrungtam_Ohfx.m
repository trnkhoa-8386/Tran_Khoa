function result = hamdaohamtrungtam_Ohfx(f, h, x_interpolate)
    result = (f(x_interpolate + h) - f(x_interpolate - h)) / (2 * h);
end