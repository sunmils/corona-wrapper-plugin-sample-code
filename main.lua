-- 
-- Abstract: wrapper Library Plugin Test Project
-- 
-- Try different text, heights, widths, fontSizes etc.

-- Load plugin library
local wrapper = require "plugin.wrapper"

local _W = display.contentWidth
local _H = display.contentHeight

local t = system.getTimer()
local timeText

local myParagraph = wrapper.newParagraph({

	text = "Wrapper Class Sample-Text\n\nCorona's framework dramatically increase productivity. \nTasks like animating objects in OpenGL or creating user-interface widgets take only one line of code, and changes are instantly viewable in the Corona Simulator.",
	width = 200,
	height = 200,                   -- fontSize will be calculated automatically if set 
	font = native.systemFont, 	-- make sure the used font is installed on your system
	--fontSize = 30,		-- not needed if height is set 	
	lineSpace = 2,
	alignment  = "center",
	
	-- Parameters for speed tweaking, just relevant if height is set
	fontSizeMin = 8,
	fontSizeMax = 30,
	incrementSize = 2
})

--displays the time needed for wrapping
timeText = display.newText(tostring(system.getTimer() - t) .. " ms", 0, display.contentHeight - display.screenOriginY - 22, nil, 12)
timeText.anchorX = 0
timeText.x = 10

myParagraph.anchorChildren = true
myParagraph.anchorX = 0.5
myParagraph.anchorY = 0
myParagraph.x = _W/2
myParagraph.y = 70
myParagraph:setTextColor({0,1,0})

local rect = display.newRoundedRect(0,0,myParagraph.width+15, myParagraph.height+15, 15 )
rect.anchorX = .5
rect.anchorY = .5
rect.x = _W/2
rect.y = 70+myParagraph.height/2
rect:setFillColor(50/255,166/255)
rect:setStrokeColor(255/255,200/255)
rect.strokeWidth = 1

myParagraph:toFront()

