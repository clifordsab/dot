widget = luastatus.require_plugin('battery-linux').widget{
    cb = function(t)
        return string.format('B %d%% (%s)', t.capacity, t.status)
    end,
}
