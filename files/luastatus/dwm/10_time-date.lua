widget = {
    plugin = 'timer',
    cb = function()
        return string.format('%s, %d %s ', os.date("%a"), os.date("%d"), os.date("%b %Y %I:%M %p"))
    end,
}
