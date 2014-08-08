require 'rails_helper'

RSpec.describe Tour, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:tour)).to be_valid
  end
end
