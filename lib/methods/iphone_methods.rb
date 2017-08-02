$LOAD_PATH << './ios_automation/lib'
module Phone_Methods
	def pull_down 
		if $device == 'iphone_7'
			Appium::TouchAction.new.press(x: 203, y: 123).move_to(x: 203, y: 356).release.perform 
		else 
			Appium::TouchAction.new.press(x: 162, y: 152).move_to(x: 162, y: 300).release.perform  
		end
	end
	
	def scroll_down  #scrolls to the bottom of the page
		Appium::TouchAction.new.swipe(start_y: 400, end_y: -400).perform
		sleep 1
	end
	
	def tutorial_check
		if element_visible?("//UIAImage[@name='......jpg']")
			element("//UIAButton[@name='Start']").click
		end
	end
	
	def iphone_login(email, pwd) ##assumes nav is displayed 
		element($iphone_nav_inbox).click
	#verify login screen is displayed, fix if it isn't
		if true != element_visible?($iphone_login_facebook)
			iphone_logout
		end
	#click on email address field to activate
		element($iphone_login_email_cell).click
	#enter email address
		if true != element_present?("//UIATableView[1]/UIATableCell[3]/UIATextField[@value='#{email}']")
			iphone_clear_login_email_field
			element($iphone_login_email_field).send_keys email
		end
	#click on password field to activate
		element($iphone_login_password_cell).click
	#enter password
		element($iphone_login_password_field).send_keys pwd
	#click Login button
		element($iphone_login_login).click	
		sleep 2
	#check if notification alert is displayed 
		general_alert_check
	end

	def iphone_clear_login_email_field ##assumes is on login screen already and in the email address field already
	#select and delete existing email address if present in email address field
		num = 1
		while true != element_present?($iphone_login_email_field) && num < 3
			if $device == 'iphone_7'
				Appium::TouchAction.new.long_press(x: 191, y: 265, duration: 1000).perform
			else
				Appium::TouchAction.new.long_press(x: 191, y: 216, duration: 1000).perform
			end
			element($iphone_select_all).click
			element($iphone_kb_delete).click
			num =+ 1
		end
		#command line alert if email address field still has characters entered in it
		if num >= 3
			puts "******TRIED TO CLEAR EMAIL ADDRESS FIELD 3 TIMES WITHOUT SUCCESS******"
		end
	end
end