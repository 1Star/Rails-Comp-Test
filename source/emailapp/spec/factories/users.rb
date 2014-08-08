# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name nil
    last_name nil
    password nil
    confirmation_token nil
    confirmation_at nil
    invitation_token nil
    invitation_at nil
    email nil
    phone nil
  end

  factory :invited_user, parent: :user do
    invitation_token { get_token }
    invitation_at Time.now
    email { Faker::Internet.email }
  end

  factory :unconfirmed_user, parent: :invited_user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.phone_number }
  end

  factory :valid_user, parent: :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password }
    confirmation_token { get_token }
    confirmation_at Time.now
    invitation_token { get_token }
    invitation_at Time.now
    email { Faker::Internet.email("#{first_name}#{last_name}") }
    phone { Faker::PhoneNumber.phone_number }
  end

end

def get_token
  SecureRandom.uuid
end
