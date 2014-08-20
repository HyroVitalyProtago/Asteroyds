-- Model.Generic.Tools

function enum(...)
    local _enum = {}
    for _,v in pairs(arg) do
        _enum[v] = v
    end
    return _enum
end
