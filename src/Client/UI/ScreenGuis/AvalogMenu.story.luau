local Avalog = script.Parent.Parent.Parent.Parent.Parent
local Fusion = require(Avalog.Parent.Fusion)
local OnyxUI = require(Avalog.Parent.OnyxUI)
local States = require(Avalog.SourceCode.Client.UI.States)
local StateExtensions = require(Avalog.SourceCode.Client.UI.StateExtensions)
local DarkTheme = require(Avalog.SourceCode.Client.UI.Themes.Dark)

local AvalogMenu = require(script.Parent.AvalogMenu)

return function(Target: Instance)
	local Scope = Fusion.scoped(Fusion, OnyxUI.Components, {
		AvalogMenu = AvalogMenu,
	})
	local Theme = OnyxUI.Themer.Theme:now()

	StateExtensions:Initialize()

	States.Open:set(true)

	States.Theme:set(DarkTheme)

	OnyxUI.Themer.Theme:is(Fusion.peek(States.Theme)):during(function()
		return Scope:AvalogMenu {
			Parent = Target,
		}
	end)

	Scope:Button {
		Content = { "Toggle" },
		Parent = Target,
		AnchorPoint = Vector2.new(0, 0),
		Position = Scope:Computed(function(Use)
			return UDim2.new(0, Use(Theme.Spacing["1"]), 0, Use(Theme.Spacing["1"]))
		end),

		OnActivated = function()
			States.Open:set(not Fusion.peek(States.Open))
		end,
	}

	return function()
		Scope:doCleanup()
		StateExtensions:Stop()
	end
end
