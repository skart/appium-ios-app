$LOAD_PATH << './lib' 
require "appium_setup"

describe "Create Account - " do
    before(:all) do
   		@random = random_num
   		app_setup
  	end

  	after(:all) do
  		if $reset== 'no'
  			iphone_logout
  		end
    	app_teardown
  	end
	
	it "Successcul Create Account", :iphone_gm_p3 => true, :iphone_smoke => true do 
		email = "email@email.com"
		password = "password"
	#go to inbox to launch login screen
		element($iphone_nav_inbox).click
	#change servers if necessary
		iphone_switch_servers
	#click Create Account link
		element($iphone_login_createacct).click
	#enter unique email address
		element($iphone_signup_email_cell).click
		element($iphone_signup_email_field).send_keys email
	#enter password
		element($iphone_signup_password_cell).click
		element($iphone_signup_password_field).send_keys password
	#click Sign up
		element($iphone_signup_signup).click
	#verify new account is created and user is logged in
		general_alert_check
		element($iphone_welcome_get_started).click
		expect(element_visible?($iphone_inbox_allmail)).to be_truthy
	#verify user account using the api
		api_login(email, password)
	end
end