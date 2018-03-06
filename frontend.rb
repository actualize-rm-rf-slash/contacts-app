require "unirest"

system "clear"
response = Unirest.get("http://localhost:3000/show_one_contact_url")
contact = response.body
puts JSON.pretty_generate(contact)
