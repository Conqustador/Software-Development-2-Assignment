-----------------------------------------------------------------------------------------
--
-- Inventory.lua
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
	InventoryImage = display.newImage("images/Arena.jpg", true)			-- Fetches and displays image
		InventoryImage.xScale = ((screen_adjustment  * InventoryImage.contentWidth)/InventoryImage.contentWidth)-- adjusts image size
		InventoryImage.yScale = InventoryImage.xScale					-- streches to full screen
		InventoryImage.x = display.contentWidth / 2
		InventoryImage.y = display.contentHeight / 2
		
-- --==***************************[ Hero upgrades /not working ]**********************************++--		
--	Hero = class(function("Hero",50,5)									-- Hero Variable is created 
--				Hero.Health = Health									-- Stats are generated to hero (global variable)
--				Hero.Damage = Damage																
--				end)
--	function Hero:Upgrade(100)											-- Upgrade function to use silver to upgrade hero stats
--		if CurrentSilver - Upgrade => 0 then							-- if player has enought silver then purchase upgrades
--			self.Health = self.Health + 20
--			self.Damage = self.Damage + 5								-- boost hero stats
--		else
--			print("not enought silver")									-- if user doensen't have silver display as feeback
--		end

-- --==***************************[ Button handler for upgrading hero *test* ]**********************************++--	
		
	local function UpgradeHeroBtnHandler()                              -- Hero upgrade function handler
       	if event.phase == 'ended' then										
			print("Hero has been upgraded")      						--prints feedback to user when hero is upgraded
		end
	end

	local UpgradeHeroBtn= widget.newButton(								-- creates a button that sends the player back to home page
		{
			label = "Upgrade Hero",										-- sets label name
			fontSize = 10,
			onEvent = UpgradeHeroBtnHandler,							-- sets function above
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
-- --==***************************[ Button leading to Campaign]**********************************++-- --

	function returnToMainMenu()                                  		-- this is the name of the function
        MainMenuImage.isVisible=true									-- sets buttons on main menu back to true
		StartCampaign.isVisible=true
		StartStore.isVisible=true
		StartChestShop.isVisible=true
		StartInventory.isVisible=true	
		MainMenu.isVisible=false										-- sets buttons on inventory page to false so they dissapear
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
 
-- --==***************************[ Groups everything on the scene ]**********************************++-- --	
	
	group:insert ( screen_adjustment,MainMenuImage,UpgradeHeroBtn,Hero,StopBattle)
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