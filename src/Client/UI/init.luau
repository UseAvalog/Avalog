local Players = game:GetService("Players")

local Avalog = script.Parent.Parent.Parent
local Fusion = require(Avalog.Parent.Fusion)
local StateExtensions = require(Avalog.SourceCode.Client.UI.StateExtensions)
local OnyxUI = require(Avalog.Parent.OnyxUI)
local OnyxUITheme = require(script.OnyxUITheme)

local AvalogMenu = require(script.ScreenGuis.AvalogMenu)

local Themer = OnyxUI.Themer

local UIService = {
	Scope = Fusion.scoped(Fusion),
	XPMultiplierDropdownIcons = {},
}

function UIService:Start()
	StateExtensions:Initialize()
	StateExtensions:Start()

	Themer.Theme:is(OnyxUITheme):during(function()
		AvalogMenu(self.Scope, {
			Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
		})
	end)
end

return UIService
