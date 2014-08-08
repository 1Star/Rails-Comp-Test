require 'rails_helper'

RSpec.describe "tours/new.html.haml", :type => :view do
  before :each do
    @user = FactoryGirl.create(:unconfirmed_user)
    clear_emails
    visit new_user_tour_path(@user)

  end

  after :each do
    @user.destroy
  end

  it 'shows Tour Information page' do
    expect(page).to have_content('Tour Information')
  end

  it 'sends email to user' do
    fill_in('tour_note', with: Faker::Lorem.sentence)
    click_on('Finish Sign Up')
    sleep 0.1
    open_email(@user.email)
    expect(current_email).to have_content('A New Tour Scheduled')
  end

  it 'sends email to admin' do
    fill_in('tour_note', with: Faker::Lorem.sentence)
    click_on('Finish Sign Up')
    sleep 0.1
    open_email('filipbalas328@gmail.com') # Admin Email Address
    expect(current_email).to have_content('A New Tour Scheduled')
  end

  it 'sends full information to admin' do
    fill_in('tour_note', with: Faker::Lorem.sentence)
    click_on('Finish Sign Up')
    sleep 0.1
    open_email('filipbalas328@gmail.com') # Admin Email Address
    expect(current_email).to have_content @user.name
  end

  it 'sends email with valid url to user' do
    fill_in('tour_note', with: Faker::Lorem.sentence)
    click_on('Finish Sign Up')
    sleep 0.1
    open_email(@user.email) # Admin Email Address
    current_email.click_link('EMAIL APP SYSTEM')
    expect(page).to have_content('Start Tour')
  end
end