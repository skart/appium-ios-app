require 'rest-client'
require 'json'

#input url and user data
url = "https://...."
account = 'email@email.com'
password = 'password'
inbox_section = "/inboxes/..."

##logs user in
login = RestClient.post (url + "/..."), {:account => { "email_address" => account, "password" => password }}

##gets contents of sent postbox
drafts = RestClient.get (url + inbox_section), {:cookies => login.cookies}
@draft = JSON.parse(drafts)

#loop until all records have been deleted.
while 0 != @draft["total_records"]
	##define variables for testing
	num = 0
	foo = 0
	list_of_ids = []
	x = @draft["per_page"]
	y = @draft["total_records"]
	x.to_i
	y.to_i
	puts " #{y} records found in #{inbox_section}"

	#set x to current page amount or total records depending on which is a higher amount
	if x > y
		x = y
	end

	##gets id of each event on the returned drafts page, and adds it to an array
	while x > num
		@id = @draft["records"][num]["event"]["id"]
		list_of_ids << @id
		num += 1
	end	
	
	while list_of_ids.count > foo
		nope = RestClient.delete (url + "/events/" + list_of_ids[foo]), {:cookies => login.cookies}
		@response = JSON.parse(nope)
		puts "record #{list_of_ids[foo]} deleted?: " + @response["status"] #output if deleting the record was successful
		foo +=1
	end
	drafts = RestClient.get (url + inbox_section), {:cookies => login.cookies}
	@draft = JSON.parse(drafts)
end

if 0 == @draft["total_records"]
	puts "No records found #{inbox_section}"
end
