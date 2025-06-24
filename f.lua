local scheduler = {};
scheduler.__index = scheduler;

function scheduler.new()
	local self = {
		scheduled = {};
	}
	
	return setmetatable(self, scheduler);
end

function scheduler:schedule(id, f)
	self.scheduled[id] = f;
end

function scheduler:fire(id, ...)
	local f = self.scheduled[id];
	
	if (f) then
		f(...);
	end
end

return scheduler;
