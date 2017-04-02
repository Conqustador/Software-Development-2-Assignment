-----------------------------------------------------------------------------------------
--
-- Store.lua
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
	StoreImage = display.newImage("images/Store.png", true)				-- Fetches and displays image
		StoreImage.xScale = ((screen_adjustment  * StoreImage.contentWidth)/StoreImage.contentWidth)-- adjusts image size
		StoreImage.yScale = StoreImage.xScale							-- streches to full screen
		StoreImage.x = display.contentWidth / 2
		StoreImage.y = display.contentHeight / 2

-- --==***************************[ Button leading to Campaign ]**********************************++-- --
local function returnToMainMenu()                                  		-- this is the name of the function
        MainMenuImage.isVisible=true									-- sets buttons on main menu back to true
		StartCampaign.isVisible=true
		StartStore.isVisible=true
		StartChestShop.isVisible=true
		StartInventory.isVisible=true	
		MainMenu.isVisible=false
		StoreImage.isVisible=false										-- sets buttons on store page to false so they dissapear
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
	
	group:insert (StoreImage,MainMenu)
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