--[[
              .__               .__          __
  ____ _____  |  |   ____  __ __|  | _____ _/  |_  ___________
_/ ___\\__  \ |  | _/ ___\|  |  \  | \__  \\   __\/  _ \_  __ \
\  \___ / __ \|  |_\  \___|  |  /  |__/ __ \|  | (  <_> )  | \/
 \___  >____  /____/\___  >____/|____(____  /__|  \____/|__|
     \/     \/          \/                \/
--]]

local load_time_start = os.clock()
local modname = minetest.get_current_modname()


minetest.register_chatcommand("c", {
	params = "",
	description = "Calculate something.",
	func = function(term)
		term = "return "..term
		return pcall(loadstring(term))
	end,
})

minetest.register_chatcommand("lua", {
	params = "",
	description = "Execute something in lua.",
	func = function(term)
		return pcall(loadstring(term))
	end,
})


local time = math.floor(tonumber(os.clock()-load_time_start)*100+0.5)/100
local msg = "["..modname.."] loaded after ca. "..time
if time > 0.05 then
	print(msg)
else
	minetest.log("info", msg)
end
