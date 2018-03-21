require "unirest"

system "clear"
puts "Choose an option:"
puts "[1] Signup"
puts "[2] Login"
puts "[3] Logout"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.post(
    "http://localhost:3000/v1/users",
    parameters: {
      name: "Test",
      email: "test@email.com",
      password: "password",
      password_confirmation: "password"
    }
  )
  p response.body
elsif input_option == "2"
  response = Unirest.post(
    "http://localhost:3000/user_token",
    parameters: {
      auth: {
        email: "peter@email.com",
        password: "password"
      }
    }
  )
  # Save the JSON web token from the response
  jwt = response.body["jwt"]
  # Include the jwt in the headers of any future web requests
  Unirest.default_header("Authorization", "Bearer #{jwt}")
  p jwt
elsif input_option == "3"
  jwt = ""
  Unirest.clear_default_headers()
end

puts "Press enter to continue"
gets.chomp


system "clear"
puts "Choose an option:"
puts "[1] Show all contacts"
puts "  [1.1] Search contacts that contain 'an'"
puts "[2] Create a contact"
puts "[3] Show one contact"
puts "[4] Update a contact"
puts "[5] Delete a contacts"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contacts = response.body
  puts JSON.pretty_generate(contacts)
elsif input_option == "1.1"
  response = Unirest.get("http://localhost:3000/v1/contacts?query=an")
  contacts = response.body
  puts JSON.pretty_generate(contacts)
elsif input_option == "2"
  params = {
    first_name: "Martha",
    middle_name: "Xavier",
    last_name: "Jang",
    bio: "This is a text",
    email: "martha@email.com",
    phone_number: "232343243"
  }
  response = Unirest.post("http://localhost:3000/v1/contacts", parameters: params)
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "3"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/contacts/#{contact_id}")
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "4"
  print "Enter a contact id: "
  contact_id = gets.chomp
  params = {
    first_name: "UpdatedFirstName",
    middle_name: "UpdatedMiddleName",
    last_name: "UpdatedLastName",
    bio: "UpdatedBio",
    email: "saron@email.com",
    phone_number: "0000000"
  }
  response = Unirest.patch("http://localhost:3000/v1/contacts/#{contact_id}", parameters: params)
  contact = response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "5"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/contacts/#{contact_id}")
  body = response.body
  puts JSON.pretty_generate(body)
end
