$LOAD_PATH << './ios_automation/lib'
require 'yaml'
module Common_Methods
	def bash(command)
  		escaped_command = Shellwords.escape(command)
  		system "bash -c #{escaped_command}"
	end
	
	def random_num
    	srand
    	rand(1000000).to_s
  	end
  	
	def element(xpath)
        return $appium_driver.find_element(:xpath, xpath)
        true
    rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end
    
    def element_visible?(xpath)
        return $appium_driver.find_element(:xpath, xpath).displayed?
        true
    rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end
    
    def element_present?(xpath)
        return expect($appium_driver.find_element(:xpath, xpath)).to be_truthy
        true
    rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end
    
    def element_not_present?(xpath)
        return expect($appium_driver.find_element(:xpath, xpath)).to be_falsey
        true
    rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end
    
    def general_alert_check
		if element_visible?("//UIAAlert") #just a general alert check
			$appium_driver.alert_accept
		end
	end
	
	def keyboard_typing(word)
		message = word.split("")
		foo = 0 
		while message.count > foo
			if " " == message[foo]
				element("//UIAKeyboard[1]/UIAKey[@name='space']").click
			else
				element("//UIAKeyboard[1]/UIAKey[@name='#{message[foo]}']").click
			end
			foo +=1
		end
	end
	
	def paper_amount_per_item(xpath)
	#get card amount from dropdown
		str = element(xpath).text
	##format string
 		no_spaces = str.gsub(/\s+/, "")
		val = str.split(" ")
    ##number of cards or cards selected
		amt = val[0].to_i  
		return amt
	end
	
	def calc_order_total(foo)
	#get string from dropdown
		str = element(foo).text
	#format string
 		no_spaces = str.gsub(/\s+/, "")
	#subtotal cards or envelopes
		subtotal = no_spaces.split(':$')[1].strip.to_f
	#return subtotal   
		return subtotal
	end

	end
	
	def keyboard_typing_special_chars(word)
		message = word.split("")
		foo = 0 
		element("//UIAKeyboard[1]/UIAKey[contains(@name, 'more, numbers')]").click
		while message.count > foo
			if " " == message[foo]
				element("//UIAKeyboard[1]/UIAKey[@name='space']").click
				element("//UIAKeyboard[1]/UIAKey[@name='more, numbers']").click
			else
				element("//UIAKeyboard[1]/UIAKey[@name='#{message[foo]}']").click
			end
			foo +=1
		end
	end
	
	def click_save_and_exit
		element("//UIAButton[@name='Save and exit']").click
	end
end

