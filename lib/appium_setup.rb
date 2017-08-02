require "rubygems"
require 'appium_lib'
require 'rspec'
require 'rspec/expectations'
require 'yaml'
require 'shellwords'
	
#define device type, device name, and environment variables
    $reset = ENV['RESET'] || 'yes'
    $real_device = ENV['REAL'] || 'yes'
    $device = ENV['DEVICE'] || 'vicenza'
    $environment = ENV['ENV'] || 'Production' #must be capitalized
    $wire_build = ENV['WIRE_BUILD'] || 'no'
    $bundle_id = ENV['APP'] || '...'
    $machine_name = ENV['MACHINE'] || '....' 
    $server = ENV['SERVER'] || 'yes' 
    if $environment == 'Production'
    	$api_env = "www"
    else 
    	$api_env = $environment
    end
    $app_path = "....."
    
#defining the device information for appium to use
    CONFIG = YAML::load(open(File.join(File.dirname(__FILE__),'hardware.yml')))[$device]
    	$device_type = CONFIG["deviceType"]
    	$ios = CONFIG["ios"]
    	$ios.to_i
    	$udid = CONFIG["udid"]

#require methods and variables by device_type
	require 'methods/common_methods'
		include Common_Methods
	require 'methods/api_methods'
		include Api_Methods
	require 'iphone_global_variables.rb'
    include Phone_Variables
	require 'methods/iphone_methods'
		include Phone_Methods

#defining the login information for appium to use based on the selected environment       
    LOGINS = YAML::load(open(File.join(File.dirname(__FILE__),'logins.yml')))[$environment]
		$user1_email = LOGINS["user1Email"]
		$user1_pwd = LOGINS["user1Pwd"]
		$user2_email = LOGINS["user2Email"]
		$user2_pwd = LOGINS["user2Pwd"]
		$user3_email = LOGINS["user3Email"]
		$user3_pwd = LOGINS["user3Pwd"]
		$admin_email = LOGINS["adminEmail"]
		$admin_pwd = LOGINS["adminPwd"]
		$noconf_email = LOGINS["noconfUser"]
		$noconf_pwd = LOGINS["noconfPwd"]
			
##SETUP & TEARDOWN
	def app_setup
		if $server == 'yes' && $reset == 'no'
			bash("bash bash_scripts/start_stop_appium.sh start")
		else $server == 'yes' && $reset == 'yes'
			bash("bash bash_scripts/start_stop_appium.sh start_reset")
		end
		sleep 4
		##APPIUM DRIVER CAPABILITIES
        if $real_device == 'no'  #run on simulator
        	desired_caps = {
   			 	platformName:  'iOS',
    			deviceName: 	"iPhone 6",
    			platformVersion: '9.3',
    			app: 			$app_path
  					}
  		elsif $real_device == 'yes' && $reset == 'yes' #app built via fastlane and appium will install fresh for every scenario
  			desired_caps = {
   			 		platformName:  'iOS',
    				deviceName: 	$device,
    				udid:    		$udid,
    				app: 			$app_path
  						}
  		elsif $real_device == 'yes' && $wire_build == 'yes' && $reset == 'no' #app build to device via xcode
  			desired_caps = {
   			 		platformName:  'iOS',
    				deviceName: 	$device,
    				udid:    		$udid,
    				bundleId:   	$bundle_id
  						}
  		end
		$driver = Appium::Driver.new(caps: desired_caps).start_driver  ##launch app
		Appium.promote_appium_methods Object
		$driver.get(http://google.com)
	end
	
	def app_teardown
		$driver.driver_quit ##close app
		if $server == 'yes'
			bash("bash bash_scripts/start_stop_appium.sh stop")
		end
	end