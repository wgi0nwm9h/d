local cleaner = {};
cleaner.__index = cleaner;

function cleaner.new()
	local self = {
		threads = {};
		connections = {};
		functions = {};
	};
	
	return setmetatable(self, cleaner);
end

function cleaner:add_thread(func)
	table.insert(self.threads, task.spawn(func));
end

function cleaner:add_connection(connection)
	table.insert(self.connections, connection);
end

function cleaner:add_function(_function)
	table.insert(self.functions, _function);
end

function cleaner:clean_up()
	for _, thread in self.threads do
		task.cancel(thread);
	end
	
	for _, connection in self.connections do
		connection:Disconnect();
	end
	
	for _, _function in self.functions do
		_function();
	end
end

return cleaner;
