$LOAD_PATH << './lib' 
require "appium_setup"

if $ios != 9  #Appium can't handle the Open popup in iOS 9 after clicking the FB OK button
	describe "Facebook Login - " do
    	before(:all) do
   			app_setup
  		end

  		after(:all) do
  			if $reset== 'no'
  				iphone_logout  
  			end
    		app_teardown
  		end
	
		it "Log in with Facebook (already logged in and approved)", :iphone_gm_p3 => true do ##assumes FB is already logged into the FB app and app is approved
			element($iphone_nav_inbox).click
			element($iphone_login_facebook).click
 			sleep 1
 			if element_visible?($iphone_fb_authed_ok)
 				element($iphone_fb_authed_ok).click
 			end
 			expect(element_visible?($iphone_login_facebook)).to be_falsey
		end
	end
end