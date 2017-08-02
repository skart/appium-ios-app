Appium iOS App Automation 
=========================================
For information on the project contact Stephanie


Appium Setup
------------
Instructions to download and install both versions are available at http://appium.io 
Install using `sudo`


Ruby & Gem Setup
----------
The Appium automation scripts are built using Ruby with the Rspec framework.  
* Ensure that at least Ruby 2.0 is installed on your system
* Perform a 'bundle install' within the directory and all the necessary gems will be installed


Device Setup
------------
Every physical device needs have developer tools installed on it in order to run automation scripts.

Developer tools can be installed through Xcode.  Once developer tools has been installed, enable automation via the Settings screen


Running Tests
-------------
The test scripts are written in the RSpec test framework. http://rspec.info/
No need to start the Appium server, starting and stopping the server is included in `lib/appium_setup.rb`.  A user just needs to execute the correct rspec or rake command. 

Tests can be run several different ways.

1. Run a single script.
	* `rspec spec/iphone/01_login/login.rb`.

2. Run all the scripts in a folder.
	* `rspec spec/iphone/01_login/*`.

3. Run all the scripts for a device (no recommended).
	* `rspec spec/iphone/*/*`.

4. Run a selection of script with a rake command(look in `Rakefile.rb` for full list of available rake commands).
	* `rake iphone_gm_p1`.

	
Command Line Run Options
-------------
Several command line options are available to customize and provide flexibility when running the Appium test scripts.
Some of these options were created to help the setup determine which set of desired capabilities to use.  

1. DEVICE
	* The name of the device being used in the test.  This sets the proper desired capabilities during the setup process. A current list of compatible devices is located in `lib/hardware.yml`
	* Default: `....`
2. ENV 
	* Determines which main staging environment to run the scripts against. List of currently available environments is located in the `lib/login.yml` file
	* Default: `Production` Must be capitalized. 
3. REAL
	* Tells Appium whether a real device or simulator is being used to run the tests
	* Default: `yes`
4. RESET
	* Appium has a --full-reset flag that installs and uninstalls the app at the beginning and end of a test script.  When the flag is off, scripts have to perform clean up steps to setup for the next script run.
	* Default: `yes`
5. WIRE_BUILD
	* This determines if the app being used was built using Xcode or the fastlane gem.  The desired capabilities change based on this option
	* Default: `no`
6. APP
	* The name of the app.  The name of the app is based on the type of app. Debug or Enterprise
	* Default: `.....`
7. MACHINE
	* For when running on different machines.  Its the username of the machine.
	* Default: `....`
8. SERVER
	* The ability to turn on or off the automatic server functionality
	* Default: `yes`