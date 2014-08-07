# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    password "MyString"
    confirmation_token "MyString"
    confirmation_at "2014-08-06 15:45:01"
    invitation_token "MyString"
    invitation_at "2014-08-06 15:45:01"
  end
end
