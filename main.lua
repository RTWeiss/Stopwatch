
local seconds = 0
local minutes = 0
local hours = 0
local days = 0
local secDisplay = ""
local minDisplay = ""
local hourDisplay = ""
local dayDisplay = ""
local start = true


 
local myText = display.newText("00:00:00.00", 160, 70, native.systemFont, 50)
    myText:setTextColor(2/255, 157/255, 249/255)

local function updateTime()
     
        seconds = seconds + 1
        
        if seconds > 99 then
        	minutes = minutes + 1
        	seconds = 0
        end

        if minutes > 59 then
        	hours = hours + 1
        	minutes = 0
        end
        if hours > 59 then
            days = days + 1
            hours = 0
        end
        
        if seconds < 10 then 
        	secDisplay = ".0"
        else
        	secDisplay = "."
        end 
	    
        if minutes < 10 then 
        	minDisplay = ":0"
        else
        	minDisplay = ":"
        end 

        if hours < 10 then 
        	hourDisplay = ":0"
        else
        	hourDisplay = ":"
        end 
        if days < 10 then
            dayDisplay = "0"
        else
            dayDisplay = ""
        end

myText.text = dayDisplay..days..hourDisplay..hours..minDisplay..minutes..secDisplay..seconds
end

--Buttons
local startBtn = display.newRect(160,210,320, 90)
    startBtn:setFillColor(2/255, 157/255, 249/255)

local resetBtn = display.newRect( 160, 300, 320, 90)
    resetBtn:setFillColor(255/255,255/255,255/255)

--Button text
local startText = display.newText("Start/Stop", 160, 210, "Helvetica", 30 )
    startText:setTextColor(255/255,255/255,255/255)

local resetText = display.newText( "Reset", 160, 300, "Helvetica", 30 )
    resetText:setTextColor(2/255, 157/255, 249/255)

--Button Functions

local function startWatch()
	if start == true then
		myTimer = timer.performWithDelay(1, updateTime, 0)
		start = false
	elseif start == false then
		timer.cancel(myTimer)
		start = true
	end
end

local function reset()
	seconds = 0
	minutes = 0
	hours = 0
    days = 0
	myText.text = "00:00:00.00"
end

startBtn:addEventListener("tap", startWatch)
resetBtn:addEventListener("tap", reset)
