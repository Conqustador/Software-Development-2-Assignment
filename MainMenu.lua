-----------------------------------------------------------------------------------------
--
-- MainMenu.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )                				-- it needs the soryboard all the time
local scene = storyboard.newScene()                      				-- and it needs this line to create a new scene or new page
local widget = require( "widget" )
------------------------------------------------------------------------------------------------------------------
function scene:createScene( event )
    local group = self.view
-- --==***************************[ Background Image]**********************************++-- --

	local screen_adjustment = 0.8										-- Variable holding a float used to control size of image
	MainMenuImage = display.newImage("images/MainMenu.png", true)		-- Fetches and displays image
		MainMenuImage.xScale = ((screen_adjustment  * MainMenuImage.contentWidth)/MainMenuImage.contentWidth)-- adjusts image size
		MainMenuImage.yScale = MainMenuImage.xScale						-- streches to full screen
		MainMenuImage.x = display.contentWidth / 2
		MainMenuImage.y = display.contentHeight / 2
		
-- --==***************************[ Button leading to Campaign]**********************************++-- --

	function handleButtonEventCampaign( event )							-- this is the name of the function
		if ( "ended" == event.phase ) then								-- sets buttons on main menu to false so they dissapear
			MainMenuImage.isVisible=false
			StartCampaign.isVisible=false
			StartStore.isVisible=false
			StartChestShop.isVisible=false
			StartInventory.isVisible=false
			storyboard.gotoScene( "Campaign", "crossFade", 1000 )		-- Here you're telling the storyboard to go to Campaign.lua file with a special effect like "crossFade" and it will take 1 second to go to the new scene
		end
	end

	StartCampaign = widget.newButton(									-- creates a button that sends the to the campaign menu
		{
			label = "Campaign",											-- sets label name
			fontSize = 10,
			onEvent = handleButtonEventCampaign,						-- sets function above
			emboss = false,
			shape = "roundedRect",
			left = 0,													-- sets sizes
			top = 15,
			width = 90,
			height = 15,
			cornerRadius = 1,
			fillColor = { default={10,140,20,1}, over={1,0.1,0.7,0.4} },-- sets colour
			strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
			strokeWidth = 4,
		}
	)

-- --==***************************[ Current player's Silver]**********************************++-- --
	
	CurrentSilver = 200													-- Variable holding current players silver
	Silver = display.newText("Silver: "..CurrentSilver, 0, 0, native.systemFont, 18 )
		Silver:setFillColor(0, 180, 50)									-- postioning and text colours are added
		Silver.anchorX = 0
		Silver.x = 250
		Silver.y = 15
		align = "left"
	function updateSilver(x)											-- Function that makes updateSilver function on campaign be update on main menu too
		CurrentSilver = CurrentSilver + x
		Silver.text = CurrentSilver
		return CurrentSilver
	end
-- --==***************************[ Button leading to Store]**********************************++-- --

	local function handleButtonEventStore( event )						-- this is the name of the function
		if ( "ended" == event.phase ) then								-- sets buttons on main menu to false so they dissapear 
			MainMenuImage.isVisible=false
			StartCampaign.isVisible=false
			StartStore.isVisible=false
			StartChestShop.isVisible=false
			StartInventory.isVisible=false
			storyboard.gotoScene( "Store", "crossFade", 1000 )			-- Here you're telling the storyboard to go to Store.lua file with a special effect like "crossFade" and it will take 1 second to go to the new scene
		end
	end

	StartStore= widget.newButton(										-- creates a button that sends the to the store menu
		{
			label = "Store",											-- sets label name
			fontSize = 10,												
			onEvent = handleButtonEventStore,							-- sets function above
			emboss = false,
			shape = "roundedRect",
			left = 0,													-- sets sizes
			top = 40,
			width = 90,
			height = 15,
			cornerRadius = 1,
			fillColor = { default={10,140,20,1}, over={1,0.1,0.7,0.4} },-- sets colour
			strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
			strokeWidth = 4,
		}
	)

-- --==***************************[ Button leading to Chest shop]**********************************++-- --
	local function handleButtonEventChestShop( event )					-- this is the name of the function
		if ( "ended" == event.phase ) then								-- sets buttons on main menu to false so they dissapear 
			MainMenuImage.isVisible=false
			StartCampaign.isVisible=false
			StartStore.isVisible=false
			StartChestShop.isVisible=false
			StartInventory.isVisible=false
			storyboard.gotoScene( "ChestShop", "crossFade", 1000 )		-- Here you're telling the storyboard to go to ChestShop.lua file with a special effect like "crossFade" and it will take 1 second to go to the new scene
		end
	end
	
	StartChestShop= widget.newButton(									-- creates a button that sends the to the ChestShop menu
		{
			label = "Chest Shop",										-- sets label name
			fontSize = 10,
			onEvent = handleButtonEventChestShop,						-- sets function above
			emboss = false,
			shape = "roundedRect",
			left = 0,													-- sets sizes
			top = 65,
			width = 90,
			height = 15,
			cornerRadius = 1,
			fillColor = { default={10,140,20,1}, over={1,0.1,0.7,0.4} },-- sets colour
			strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
			strokeWidth = 4,
		}
	)

-- --==***************************[ Button leading to Inventory]**********************************++-- --
	local function handleButtonEventInventory( event )					-- this is the name of the function
		if ( "ended" == event.phase ) then								-- sets buttons on main menu to false so they dissapear 
			MainMenuImage.isVisible=false
			StartCampaign.isVisible=false
			StartStore.isVisible=false
			StartChestShop.isVisible=false
			StartInventory.isVisible=false
			storyboard.gotoScene( "Inventory", "crossFade", 1000 )		-- Here you're telling the storyboard to go to Inventory.lua file with a special effect like "crossFade" and it will take 1 second to go to the new scene
		end
	end
	
	StartInventory= widget.newButton(									-- creates a button that sends the to the inventory menu
		{
			label = "Inventory",										-- sets label name
			fontSize = 10,
			onEvent = handleButtonEventInventory,						-- sets function above
			emboss = false,
			shape = "roundedRect",
			left = 0,													-- sets sizes
			top = 90,
			width = 90,
			height = 15,
			cornerRadius = 1,
			fillColor = { default={10,140,20,1}, over={1,0.1,0.7,0.4} },-- sets colour
			strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
			strokeWidth = 4,
		}
	)
		 
-- --==***************************[ Groups everything on the scene ]**********************************++-- --	
	
--	group:insert (screen_adjustment,MainMenuImage,StartCampaign,StartStore,StartChestShop,StartInventory)
end

-- --==***************************[ ENTER SCENE ]**********************************++-- --

function scene:enterScene( event )
    local group = self.view
    
end
-- --==***************************[ EXIT SCENE ]**********************************++-- --

function scene:exitScene( event )
    local group = self.view
    
end

-- --==**************************[ DESTROY SCENE ]*********************************++-- --

function scene:destroyScene( event )
    local group = self.view    

end
-------------------------------------------------------------------------------------------------

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene