class Contact < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%B %e, %Y")
  end

  def full_name
    "#{last_name}, #{first_name}"
  end

  def japan_phone_number
    "+81 #{phone_number}"
  end

  def as_json
    {
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      full_name: full_name,
      bio: bio,
      email: email,
      phone_number: phone_number,
      japan_phone_number: japan_phone_number
    }
  end
end
