widget = {
    plugin = 'timer',
    opts = {period = 2},
    cb = function()
        local f = assert(io.open('/sys/class/thermal/thermal_zone0/temp', 'r'))
        local temp = f:read('*number') / 1000
        f:close()
        return string.format('T %dºC', temp)
    end,
}
