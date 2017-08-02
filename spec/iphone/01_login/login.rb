$LOAD_PATH << './lib' 
require "appium_setup"

describe "User Login - " do
    before(:all) do
   		app_setup
  	end

  	after(:all) do
    	app_teardown
  	end
	
	it "Login and logout with existing account" do 
	#login
		iphone_login $user1_email, $user1_pwd
	#logout	
		iphone_logout
	end
	
	it "Can't login with malformed email address - missing @" do 
		element($iphone_nav_inbox).click
	#click on email address field to activate
		element($iphone_login_email_cell).click
	#clear email address field if not empty
		iphone_clear_login_email_field
	#enter email address
		element($iphone_login_email_field).send_keys "emailaddress.com"
	#click on password field to activate
		element($iphone_login_password_cell).click
	#enter password
		element($iphone_login_password_field).send_keys $user1_pwd
	#click Login button
		element($iphone_login_login).click
	#verify proper alert is displayed	
		expect(element_visible?("//UIAAlert[@name='Invalid Email Address']/UIAScrollView[1]/UIAStaticText[@value='Please enter a valid email address']")).to be_truthy	
	#dismiss alert
		$appium_driver.alert_accept
		element($iphone_login_cancel).click
	end
	
	it "Can't login with incorrect password" do 
		element($iphone_nav_inbox).click
	#click on email address field to activate
		element($iphone_login_email_cell).click
	#clear email address field if not empty
		iphone_clear_login_email_field
	#enter email address
		element($iphone_login_email_field).send_keys $user1_email
	#click on password field to activate
		element($iphone_login_password_cell).click 
	#enter password
		element($iphone_login_password_field).send_keys "notpwd123"
	#click Login button
		element($iphone_login_login).click
	#verify proper alert is displayed	
		expect(element_visible?("//UIAAlert[@name='Oops!']/UIAScrollView[1]/UIAStaticText[@value='Please enter a valid email address and password.']")).to be_truthy
	#dismiss alert
		$appium_driver.alert_accept
	end
end