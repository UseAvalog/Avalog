local Avalog = script.Parent.Parent.Parent.Parent.Parent
local OnyxUI = require(Avalog.Parent.OnyxUI)
local Fusion = require(Avalog.Parent.Fusion)

local ItemsTab = require(script.Parent.ItemsTab)

export type Props = ItemsTab.Props & {}

return function(Scope: Fusion.Scope<any>, Props: Props)
	local Scope = Fusion.innerScope(Scope, Fusion, OnyxUI.Util, OnyxUI.Components, {
		ItemButton = require(script.Parent.ItemButton),
		ItemsTab = require(script.Parent.ItemsTab),
	})

	local FeaturedItems = Scope:Value({})

	return Scope:ItemsTab(OnyxUI.Util.CombineProps(Props, {
		Name = script.Name,
		Items = Scope:ForValues(FeaturedItems, function(Use, Scope, Item)
			return {
				Id = Item.Id,
				Type = Item.Type,
			}
		end),
	}))
end
