$LOAD_PATH << './ios_automation/lib'
require 'rest-client'
require 'json'

$api_base_url = "https://#{$api_env}........com/../..."
$api_session = "/session"
$api_inbox_received = "/.../..."
$api_inbox_drafts = "/.../..."
$api_event = "/..."
$api_event_photos = "/...."

module Api_Methods
	def api_login(email, pwd)
		login = RestClient.post "#{$api_base_url}#{$api_session}", {:account => { "email_address" => email, "password" => pwd }}
		expect(login.code == 200).to be_truthy
		return login
	end
	
	def inbox_received(user, pwd)
		login = api_login(user, pwd)
		received = RestClient.get "#{$api_base_url}#{$api_inbox_received}", {:cookies => login.cookies}
		return JSON.parse(received)
	end
	
	def received_card(user, pwd, card_title)
		@received_inbox = inbox_received(user, pwd)
		x = @received_inbox["..."]
		x.to_i
		num = 0
		while card_title != @received_inbox["..."][num]["..."]["..."] && num <= x
			num += 1 
		end
		expect(card_title == @received_inbox["..."][num]["..."]["..."]).to be_truthy
		expect("..." == @received_inbox["..."][num]["..."]["..."]).to be_truthy
	end
end
