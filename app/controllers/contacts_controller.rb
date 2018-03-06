class ContactsController < ApplicationController
  def show_one_contact_method
    contact = Contact.first
    render json: {
      first_name: contact.first_name,
      last_name: contact.last_name,
      email: contact.email,
      phone_number: contact.phone_number
    }
  end

  def show_all_contacts_method
    contacts = Contact.all
    contact_hashes = contacts.map do |contact|
      {
        first_name: contact.first_name,
        last_name: contact.last_name,
        email: contact.email,
        phone_number: contact.phone_number
      }
    end
    render json: contact_hashes
  end
end
