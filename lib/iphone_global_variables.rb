module Phone_Variables
	##FIRST RUN 		
  		$tutorial_start = "//UIAButton[@name='Start']"
	
	##LOGIN 
		$iphone_login_cancel = "//UIAButton[@name='Cancel']"
		$iphone_login_facebook = "//UIAButton[contains(@name, 'Facebook')]"
		$iphone_login_email_cell = "//UIATableView[1]/UIATableCell[3]" 
		$iphone_login_email_field = "//UIATextField[@value='Email address']" 
		$iphone_login_password_cell = "//UIATableView[1]/UIATableCell[4]"
		$iphone_login_password_field = "//UIASecureTextField[@value='Password']"
		$iphone_login_login = "//UIAButton[@name='Log In']"
 		$iphone_login_forgotpwd = "//UIAButton[@name='Forgot password?']"
 		$iphone_login_createacct = "//UIAButton[@name='Create account']"
		##CREATE AN ACCOUNT
			$iphone_signup_back = "//UIAButton[@name='Back']"
 			$iphone_signup_facebook = "//UIAButton[@name='Log in with Facebook']"
	  		$iphone_signup_email_cell = "//UIATableView[1]/UIATableCell[3]"
	  		$iphone_signup_email_field = "//UIATableView[1]/UIATableCell[3]/UIATextField[@value='Email address']" 
			$iphone_signup_password_cell = "//UIATableView[1]/UIATableCell[4]"
			$iphone_signup_password_field = "//UIATableView[1]/UIATableCell[4]/UIASecureTextField[@value='Password']"
			$iphone_signup_signup = "//UIAButton[@name='Sign Up']"
			$iphone_signup_terms = "//UIATableView[1]/UIATableGroup[4]/UIAStaticText[]"
	
	##FACEBOOK LOGIN
		$iphone_fb_authed_ok = "//UIAButton[@name='OK']"
		$iphone_fb_authed_cancel = "//UIAButton[@name='Cancel']"
end



















