-- wrapper plugin sample code
--
-- Please read instruction at the top of the wrapper.lua file carefully
--

local _W = display.contentWidth
local _H = display.contentHeight

-- Try different text, heights, widths, fontSizes etc.

-- size of the frame
local textFrameWidth = 210
local textFrameHeight = 210

-- size of the paragraph
local paragraphWidth = 200
local paragraphHeight = 200

-- create a frame for the paragraph
local rect = display.newRoundedRect(0,0,textFrameWidth, textFrameHeight, 15 )
rect.anchorX = .5
rect.anchorY = .5
rect.x = _W/2
rect.y = _H/3
rect:setFillColor(50/255,166/255)
rect:setStrokeColor(255/255,200/255)
rect.strokeWidth = 1

-- timer start
local t = system.getTimer()
local timeText

-- create the paragraph
local myParagraph = wrapper.newParagraph(
{
    text = "Wrapper Class Sample-Text\n\nCorona's framework dramatically increase productivity. \nTasks like animating objects in OpenGL or creating user-interface widgets take only one line of code, and changes are instantly viewable in the Corona Simulator.",
    width = paragraphWidth,
    height = paragraphHeight,   -- fontSize will be calculated automatically if set 
    font = native.systemFont,   -- make sure the used font is installed on your system
    --fontSize = 30,            -- not needed if height is set 	
    lineSpace = 2,
    alignment  = "justify",      -- "left", "right", "center" or "justify" 
    
    -- these Parameters are just relevant if height is set
    fontSizeMin = 4,           -- for speed tweaking
    incrementSize = 2,          -- for speed tweaking
    fontSizeMax = 24
})

-- display the time needed for wrapping
timeText = display.newText(tostring(system.getTimer() - t) .. " ms", 0, display.contentHeight-display.screenOriginY - 22, nil, 20)
timeText.anchorX = 0
timeText.x = 10

-- paragraph positioning
myParagraph.anchorChildren = true
myParagraph.anchorX = 0.5
myParagraph.anchorY = 0.5
myParagraph.x = _W/2
myParagraph.y = _H/3

-- change textcolor of the paragraph
myParagraph:setTextColor({0,1,0})

myParagraph:toFront()
