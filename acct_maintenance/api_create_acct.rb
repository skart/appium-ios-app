require 'rest-client'
require 'json'
require 'yaml'

#set environment
$environment = ENV['ENV'] || '....'  #must be capitalized to match format in login.yml 

#pull in emails and passwords
LOGINS = YAML::load(open(File.join(File.dirname(__FILE__),'../lib/logins.yml')))[$environment]
	$user1_email = LOGINS["user1Email"]
	$user1_pwd = LOGINS["user1Pwd"]
	$user2_email = LOGINS["user2Email"]
	$user2_pwd = LOGINS["user2Pwd"]
	$user3_email = LOGINS["user3Email"]
	$user3_pwd = LOGINS["user3Pwd"]
	$user4_email = LOGINS["user4Email"]
	$user4_pwd = LOGINS["user4Pwd"]
	$noconf_email = LOGINS["noconfUser"]
	$noconf_pwd = LOGINS["noconfPwd"]



if $environment != "Production" && $environment != "www"
	url = "https://#{$environment}......com/api/v1/accounts"
	email = ['x', $user1_email, $user2_email, $user3_email, $user4_email, $noconf_email]
	pwd = ['x', $user1_pwd, $user2_pwd, $user3_pwd, $user4_pwd, $noconf_pwd]
	num = 1 
	
	while num < 6
		login = RestClient.post url, {:account => { "email_address" => email[num], "password" => pwd[num] }}
		@response = JSON.parse(login)
		if "success" == @response["status"]
			puts "SUCCESS: #{email[num]}"
		else
			puts "FAILURE: #{email[num]}"
		end
		num +=1
	end
else
	puts "This script is not meant to be run on Production"
end