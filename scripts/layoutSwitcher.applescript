tell application "System Events"
	delay 0.5
	
	-- 设置窗口位置和大小（根据你的需求调整）
	set screenX to 1728
	set screenY to -1000
	set screenWidth to 1600
	set screenHeight to 2200
	
	set cursorHeight to screenHeight * 2.2 / 3
	set iTerm2Height to screenHeight * 1 / 3
	
	-- 用 System Events 控制 Cursor 窗口
	tell application process "Cursor"
		-- 如果窗口最小化，则还原
		set theWindow to window 1
		if value of attribute "AXMinimized" of theWindow is true then
			set value of attribute "AXMinimized" of theWindow to false
			delay 0.3 -- 等待窗口恢复完成
		end if
		
		if (count of windows) > 0 then
			set position of window 1 to {screenX, screenY}
			set size of window 1 to {screenWidth, cursorHeight}
		end if
	end tell
	
	
	tell application process "iTerm2"
		set theWindow to window 1
		if value of attribute "AXMinimized" of theWindow is true then
			set value of attribute "AXMinimized" of theWindow to false
			delay 0.3 -- 等待窗口恢复完成
		end if
		
		if (count of windows) > 0 then
			set position of window 1 to {screenX, screenY + cursorHeight + 40}
			set size of window 1 to {screenWidth, iTerm2Height}
		end if
	end tell
	
	
	tell application "iTerm" to activate
	tell application "Cursor" to activate
	
end tell
