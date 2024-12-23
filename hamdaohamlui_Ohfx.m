function result = hamdaohamlui_Ohfx(f, h, x_interpolate)
    result = (f(x_interpolate) - f(x_interpolate - h)) / h;
end