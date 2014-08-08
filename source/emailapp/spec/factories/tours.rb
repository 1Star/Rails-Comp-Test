# Read about factories at https://github.com/thoughtbot/factory_girl
AMENITIES = ['pool', 'rec room', 'movie theater', 'on site doctor', 'time machine']
  
FactoryGirl.define do
  factory :tour do
    tour_date Time.now
    amenity { get_amenity }
    note { Faker::Lorem.sentence }
  end
end

def get_amenity
  AMENITIES[Time.now.to_i % 5]
end