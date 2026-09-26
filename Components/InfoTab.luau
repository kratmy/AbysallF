return function(Window)
	local LatestChangelog = {
		"26.9.2026",

		-- Green = Added
		"<font color='rgb(0, 255, 0)'>+ Added Bypassed DarkDexV3</font>",
		"<font color='rgb(0, 255, 0)'>+ Added Tabs Sort</font>",
		"<font color='rgb(0, 255, 0)'>+ Added Disable Rain In Doors Lobby</font>",
		"<font color='rgb(0, 255, 0)'>+ Added Visuals In Doors Lobby</font>",
		"<font color='rgb(0, 255, 0)'>+ Added Reset Volume Button</font>",
		"<font color='rgb(0, 255, 0)'>+ Enabled Custom Cursor In Doors Lobby</font>",

		-- Yellow = Sum shi
		"<font color='rgb(255, 255, 0)'>~ FIXED REPLICATESIGNAL!!!!!!</font>",
		"<font color='rgb(255, 255, 0)'>~ Fixed Queue On Teleport</font>",
		"<font color='rgb(255, 255, 0)'>~ Fixed Empty Tabs Cuz Im Stupid</font>",
		"<font color='rgb(255, 255, 0)'>~ Fixed Functions Not Being Red</font>",
		"<font color='rgb(255, 255, 0)'>~ Fixed Visuals Being Completion</font>",
		"<font color='rgb(255, 255, 0)'>~ Fixed More Functions Not Being Red</font>",
		"<font color='rgb(255, 255, 0)'>~ Fixed Disable Rain</font>",
		"<font color='rgb(255, 255, 0)'>~ Moved Some Tabs</font>",
		"<font color='rgb(255, 255, 0)'>~ Moved Changelog Above Credits</font>",
		"<font color='rgb(255, 255, 0)'>~ Updated Default Themes</font>",

		-- Red = Removed
		"<font color='rgb(255, 0, 0)'>- Removed Knob Farm :(</font>",
		"<font color='rgb(255, 0, 0)'>- Removed Discord Links</font>",
		"<font color='rgb(255, 0, 0)'>- Removed Abysall Hub Names</font>",
		"<font color='rgb(255, 0, 0)'>- Removed FOV KeyBind</font>",
	}

	
	local function CloneReference(Object)
		if Abysall and Abysall.Environment.cloneref then
			return Abysall.Environment.cloneref(Object)
		else
			return Object
		end
	end

	local Services = setmetatable({}, {
		__index = function(self, Name)
			return CloneReference(game:GetService(Name))
		end
	})

	local Library = Abysall.Interface.Library
	local SaveManager = Abysall.Interface.SaveManager
	local ThemeManager = Abysall.Interface.ThemeManager

	local Toggles = Library.Toggles
	local Options = Library.Options

	local LocalPlayer = Services.Players.LocalPlayer
	local InfoTab = Window:AddTab("Info", "user")

	local User = InfoTab:AddLeftGroupbox("User Info")

	local ImageSize = Enum.ThumbnailSize.Size420x420
	local ImageType = Enum.ThumbnailType.HeadShot

	local Content = Services.Players:GetUserThumbnailAsync(LocalPlayer.UserId, ImageType, ImageSize)

	User:AddImage("UserIcon", {
		Image = Content
	})

	User:AddLabel("ID: " .. LocalPlayer.Name, true)
	User:AddLabel("Total Executions: " .. (Abysall.TotalExecutions and Abysall.TotalExecutions or "N/A"), true)

	
    local CreditsList = {
		"<font color='rgb(27, 189, 198)'>Kratmy — Owner of this aah fork</font>",
		"<font color='rgb(255, 165, 0)'>FireBacon — Owner of the Discontinued Script</font>",
		"<font color='rgb(197, 63, 132)'>Rhyan57 — Provided the Infinite Crucifix</font>",
		"<font color='rgb(241, 106, 212)'>Abbas - Basicly a developer</font>",
		"<font color='rgb(50, 205, 50)'>" .. LocalPlayer.Name .. " — For Using This Script</font>"
	}
	

    local Changelog = InfoTab:AddRightGroupbox("Changelog")
	for Index, Change in pairs(LatestChangelog) do
		Changelog:AddLabel(Change, true)
	end

	local Credits = InfoTab:AddRightGroupbox("Credits")
	for Index, Credit in pairs(CreditsList) do
		Credits:AddLabel(Credit, true)
	end

	local Name, Version = Abysall.Environment.identifyexecutor()
	local Executor = InfoTab:AddRightGroupbox("Executor Info")
	Executor:AddLabel("Name: " .. Name, true)
	Executor:AddLabel("Version: " .. (Version and Version or "N/A"), true)
	Executor:AddDivider()
	Executor:AddLabel("Test Result: ", true)

	for Index, Result in pairs(Abysall.Environment.Results) do
		Result = Result:gsub("<", "(")
		Result = Result:gsub(">", ")")
		
		Executor:AddLabel(Result, true)
	end

	local Scripts = InfoTab:AddLeftGroupbox("Scripts")
	Scripts:AddButton("InfiniteYield", {
		Text = "Infinite Yield",
		Default = false,
		Tooltip = "Runs infinite yield.",
		Func = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
		end
	})

	Scripts:AddButton("DarkDexV3", {
		Text = "Bypassed DarkDexV3",
		Default = false,
		Tooltip = "Runs Bypassed DarkDexV3.",
		Func = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/refs/heads/main/Universal/BypassedDarkDexV3.lua"))()
		end
	})
end