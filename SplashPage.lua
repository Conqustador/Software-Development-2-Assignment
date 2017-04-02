-----------------------------------------------------------------------------------------
--
-- SplashPage.lua
--
-----------------------------------------------------------------------------------------
-- --==***************************[ Initialisation requirements]**********************************++-- --
local storyboard = require( "storyboard" )                				-- it needs the soryboard all the time
local scene = storyboard.newScene()                      				-- and it needs this line to create a new scene or new page
local widget = require( "widget" )
------------------------------------------------------------------------------------------------------------------
-- --==***************************[ Creating the scene]**********************************++-- --
function scene:createScene( event )										
    local group = self.view
	
-- --==***************************[ Background Image]**********************************++-- --
	local screen_adjustment = 0.6										-- Variable holding a float used to control size of image	
	local SplashImage = display.newImage("images/SplashImage.jpg", true)-- Fetches and displays image
		SplashImage.xScale = ((screen_adjustment  * SplashImage.contentWidth)/SplashImage.contentWidth)-- adjusts image size
		SplashImage.yScale = SplashImage.xScale							-- streches to full screen
		SplashImage.x = display.contentWidth / 2
		SplashImage.y = display.contentHeight / 2
		
-- --==***************************[ Version No ]**********************************++-- --
	local VersionNo = display.newText( "Version: 1.1", 0, 0, native.systemFont, 10 )--text box is added showing which version the game currently is on
		VersionNo:setFillColor(190, 33, 33)								--sets colour white to version number
		VersionNo.anchorX = 0											--places it on the top right corner
		VersionNo.x = 460
		VersionNo.y = 15
		align = "left"
-- --==***************************[ Game Logo]**********************************++-- --
	local LogoImage = display.newImage( "images/GameLogo.png", 220, 150)-- Fetches and displays image
		LogoImage.xScale = ((screen_adjustment  * LogoImage.contentWidth)/LogoImage.contentWidth)-- adjusts image size
		LogoImage.yScale = LogoImage.xScale
		LogoImage.x = display.contentWidth / 2
		LogoImage.y = display.contentHeight / 4
		LogoImage:scale( 0.5, 0.5 )
		
-- --==***************************[ Creates the size of the loading bar ]**********************************++-- --
	
	local loadingWidth, loadingHeight, loadingCorners = 200, 30, 10		-- Create variables for the width, height, and corners for loading bar
	
-- --==***************************[ Creates the colour of the loading bar ]**********************************++-- --	 
	
	local loadingBarBackground = display.newRoundedRect(0,0,loadingWidth,loadingHeight,loadingCorners)			-- Create the loading bar white background. 
		loadingBarBackground.x, loadingBarBackground.y = display.contentWidth * 0.5, display.contentHeight * 0.5-- Loading background is placed on the center of the screen.
		
-- --==***************************[ creates the red loading bar to show progress ]**********************************++-- --	 
	
	local loadingBar = display.newRoundedRect(0,0,loadingWidth*0.975,loadingHeight*0.925,loadingCorners)		-- Create the actual loading bar that will move. 
		loadingBar.anchorX = 0
		loadingBar.x, loadingBar.y = loadingBarBackground.x - (loadingWidth * 0.4875), loadingBarBackground.y	-- Its samller than loadingBarBackground so you can see the bar loading up
		loadingBar:setFillColor(255,0,0)
		loadingBar.xScale = 1
	 
	 
	local function updateLoading(percent)-- This function will update based on a percentage.
		loadingBar.xScale = percent / 100 --Pass in values like 10, 40, or 50 to update the percentage to 10%, 40%, or 50% respectively.
	end
	
-- --==***************************[ Loading Bar Text ]**********************************++-- --

	local LoadingText = Loading						--text box is added showing player that loading is happening
	Loading = display.newText( "Loading", 0, 0, native.systemFont, 10 )
	Loading:setFillColor( 120,120,120 )
	Loading.anchorX = 0								--sets all atributes such as sizing and colour
	Loading.x = 220
	Loading.y = 190
	align = "left"
	
-- --==***************************[ Loading Bar Increase ]**********************************++-- --	
	local function handleButtonEvent( event )		--creates a function that will change from scene splashpage to main menu
		local phase = event.phase					--once the button is pressed all splashpage atributes:bacground logo, version loading bar and loading text will be removed
		if  "ended" == event.phase then
			SplashImage:removeSelf()
			LogoImage:removeSelf()
			VersionNo:removeSelf()
			loadingBarBackground:removeSelf()
			loadingBar:removeSelf()
			Loading:removeSelf()
			StartGame:removeSelf()
			StartGame = nil
			storyboard.gotoScene( "MainMenu", "crossFade", 1000 )-- Here you're telling the storyboard to go to MainMenu.lua file with a special effect like "crossFade" and it will take 1 second to go to the new scene
		end
	end

	local counter = 0 						-- Create a counter
	local function doSomething() 			-- create the function
		counter = counter + 1 				-- increase counter by 1
		updateLoading(counter) 				-- pass in the counter to updateLoading()
		if counter >= 100 then
			StartGame = widget.newButton(	--creates new button
			{
				label = "Tap to start",		-- labels button tap to start
				fontSize = 10,				--sets button properties
				onEvent = handleButtonEvent,--loads button handleButtonEvent function
				emboss = false,
				shape = "roundedRect",		-- Properties for a rounded rectangle button
				left = 190,					--sets button properties
				top = 180,
				width = 90,
				height = 15,
				cornerRadius = 1,
				fillColor = { default={120,140,20,1}, over={1,0.1,0.7,0.4} },
				strokeColor = { default={1,0,0,1}, over={0.8,0.8,1,1} },
				strokeWidth = 4,
			}
		)
		end
	end

-- --==***************************[ Loading Bar Speed ]**********************************++-- --
	timer.performWithDelay(10, doSomething, 100) -- run the timer every 10 miliseconds to reach 100%
	-- Function to handle button events	

-- --==***************************[ Groups everything on the scene ]**********************************++-- --	
	
	group:insert ( screen_adjustment,SplashImage,VersionNo,loadingWidth, loadingHeight, loadingCorners,loadingBarBackground,loadingBar,updateLoading,counter,doSomething,StartGame )
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
-- --==**************************[ Event Listeners]*********************************++-- --
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene