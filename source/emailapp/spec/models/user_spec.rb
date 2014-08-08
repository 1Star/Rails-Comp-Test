require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:valid_user)).to be_valid
  end

  it 'is invalid without email on create' do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end

  it 'is invalid without invitation token on create' do
    expect(FactoryGirl.build(:user, invitation_token: nil)).not_to be_valid
  end

  it 'is invalid without first name on update' do
    user = FactoryGirl.create(:invited_user)
    user.first_name = nil
    expect(user.save).not_to be_truthy
  end

  it 'is invalid without last name on update' do
    user = FactoryGirl.create(:invited_user)
    user.last_name = nil
    expect(user.save).not_to be_truthy
  end

  it 'is invalid without phone name on update' do
    user = FactoryGirl.create(:invited_user)
    user.phone = nil
    expect(user.save).not_to be_truthy
  end

  it 'is invalid with invalid email format' do
    expect(FactoryGirl.build(:invited_user, email: 'xxx')).not_to be_valid
  end

  it 'returns a user\'s full name as a string' do
    user = FactoryGirl.build(:valid_user, first_name: 'John', last_name: 'Doe')
    expect(user.name).to eq('John Doe')
  end
end
