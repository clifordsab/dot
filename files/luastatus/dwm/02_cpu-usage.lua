widget = luastatus.require_plugin('cpu-usage-linux').widget{
    cb = function(usage)
        if usage ~= nil then
            return string.format('C %.1f%%', usage * 100)
        end
    end,
}
