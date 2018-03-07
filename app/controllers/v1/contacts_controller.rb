class V1::ContactsController < ApplicationController
  def show_one_contact_method
    contact = Contact.first
    render json: contact.as_json
  end

  def show_all_contacts_method
    contacts = Contact.all
    render json: contacts.as_json
  end
end
