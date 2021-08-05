widget = {
    plugin = 'pulse',
    cb = function(t)
        if t.mute then
            return 'V X'
        end
        local percent = (t.cur / t.norm) * 100
        return string.format('V %d', math.floor(0.5 + percent))
    end,
}
