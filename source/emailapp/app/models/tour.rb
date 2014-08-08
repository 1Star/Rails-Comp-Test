class Tour < ActiveRecord::Base
  AMENITIES = ['pool', 'rec room', 'movie theater', 'on site doctor', 'time machine']
  belongs_to :user
end
