Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/show_one_contact_url" => "contacts#show_one_contact_method"
end
