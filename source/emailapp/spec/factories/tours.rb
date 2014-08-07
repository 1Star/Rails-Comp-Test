# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tour do
    tour_date "2014-08-06"
    amenity "MyString"
    note "MyString"
    user_id 1
  end
end
