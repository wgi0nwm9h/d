local api = {};

api.library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))();
api.scheduler = loadstring(game:HttpGet("https://raw.githubusercontent.com/wgi0nwm9h/d/refs/heads/main/f.lua"))();
api.cleaner = loadstring(game:HttpGet("https://raw.githubusercontent.com/wgi0nwm9h/d/refs/heads/main/e.lua"))();

api.services = setmetatable({}, {
    __index = function(_, service)
        return cloneref(game:GetService(service));
    end
})

return api;
