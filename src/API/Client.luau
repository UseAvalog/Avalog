local SOURCE = script.Parent.SourceCode
local PACKAGES = script.Parent.Parent
local CLIENT = SOURCE.Client

local States = require(SOURCE.Client.UI.States)
local Fusion = require(PACKAGES.Fusion)
local Bootloader = require(PACKAGES.Bootloader)

local function GetModules()
	local Modules = {}

	for _, Child in ipairs(CLIENT:GetChildren()) do
		if Child:IsA("ModuleScript") then
			table.insert(Modules, Child)
		end
	end

	return Modules
end

local AvalogClient = {
	Bootloader = Bootloader(GetModules()),
	Started = false,
}

function AvalogClient:Start()
	assert(not self.Started, "Avalog already started.")
	self.Started = true

	AvalogClient.Bootloader:Initialize()
	AvalogClient.Bootloader:Start()
end

function AvalogClient:ToggleOpen()
	States.Open:set(not Fusion.peek(States.Open))
end

function AvalogClient:SetOpen(Open: boolean)
	States.Open:set(Open)
end

return AvalogClient
