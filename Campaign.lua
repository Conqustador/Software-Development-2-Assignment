-----------------------------------------------------------------------------------------
--
-- Campaign.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )                				-- it needs the soryboard all the time
local scene = storyboard.newScene()                      				-- and it needs this line to create a new scene or new page
local widget = require( "widget" )
------------------------------------------------------------------------------------------------------------------
function scene:createScene( event )
    local group = self.view
-- --==***************************[ Background Image]**********************************++-- --
	local screen_adjustment = 0.7										-- Variable holding a float used to control size of image
	CampaignMap = display.newImage("images/CampaignMap.png", true)		-- Fetches and displays image
		CampaignMap.xScale = ((screen_adjustment  * CampaignMap.contentWidth)/CampaignMap.contentWidth)-- adjusts image size
		CampaignMap.yScale = CampaignMap.xScale							-- streches to full screen
		CampaignMap.x = display.contentWidth / 2
		CampaignMap.y = display.contentHeight / 2

-- --==***************************[ Button that takes user to battle]**********************************++-- --
	local function handleButtonEventBattle( event )						-- this is the name of the function
		if event.phase == 'ended' then									-- Disable the button so it can't be clicked again
			Battle.isVisible=false
			MainMenu.isVisible=false									-- sets buttons on campaign page to false so they dissapear
			storyboard.gotoScene( "Battle", "crossFade", 1000 )			-- Here you're telling the storyboard to go to Battle.lua file with a special effect like "crossFade" and it will take 1 second to go to the new scene
		end
	end	

	Battle = widget.newButton(											-- creates a button that sends the player to battle page
		{
			label = "Battle",											-- sets label name
			fontSize = 10,
			onEvent = handleButtonEventBattle,							-- sets function above
			emboss = false,
			shape = "roundedRect",
			left = 300,													-- sets sizes
			top = 280,
			width = 90,
			height = 15,
			cornerRadius = 1,
			fillColor = { default={10,140,20,1}, over={1,0.1,0.7,0.4} },-- sets colour
			strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
			strokeWidth = 4
		}
	)
-- --==***************************[ Button that returns to main menu ]**********************************++-- --
	local function returnToMainMenu()                                   -- this is the name of the function
        MainMenuImage.isVisible=true									-- sets buttons on main menu back to true
		StartCampaign.isVisible=true
		StartStore.isVisible=true
		StartChestShop.isVisible=true
		StartInventory.isVisible=true	
		MainMenu.isVisible=false
		Battle.isVisible=false
		Reward.isVisible=false		
		storyboard.gotoScene( "MainMenu", "crossFade", 1000 )      		-- Here you're telling the storyboard to go to MainMenu.lua file with a special effect like "crossFade" and it will take 1 second to go to the new scene
    return true
end	
	
	MainMenu = widget.newButton(										-- creates a button that sends the player back to main menu
		{
			label = "Main Menu",										-- sets label name
			fontSize = 10,
			onEvent = returnToMainMenu,									-- sets function above
			emboss = false,
			shape = "roundedRect",
			left = 420,													-- sets sizes
			top = 15,
			width = 90,
			height = 15,
			cornerRadius = 1,
			fillColor = { default={10,140,20,1}, over={1,0.1,0.7,0.4} },-- sets colour
			strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
			strokeWidth = 4,
		}
	)

-- --==***************************[ Give player silver rewards ]**********************************++-- --		
	function handleButtonEventSilver( event )
		if event.phase == 'ended' then									-- Disable the button so it can't be clicked again
			CurrentSilver = updateSilver(50)
		end
	end	

	Reward = widget.newButton(											-- creates a button that gives the player silver whenever clicked on
		{
			label = "Collect Reward",									-- sets label name	
			fontSize = 10,
			onEvent = handleButtonEventSilver,							-- sets function above
			emboss = false,
			shape = "roundedRect",
			left = 15,													-- sets sizes
			top = 280,
			width = 90,
			height = 15,
			cornerRadius = 1,
			fillColor = { default={10,140,20,1}, over={1,0.1,0.7,0.4} },-- sets colour
			strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
			strokeWidth = 4,
		}
	)
	 
-- --==***************************[ Groups everything on the scene ]**********************************++-- --	
	
	group:insert ( screen_adjustment,CampaignMap,Battle,MainMenu)
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