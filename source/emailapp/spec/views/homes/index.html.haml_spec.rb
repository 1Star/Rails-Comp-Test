require 'rails_helper'

RSpec.describe "homes/index.html.haml", :type => :view do
  describe 'Activating user' do
    context 'with valid email' do
      before :each do
        clear_email
        visit '/'
        
      end

      it 'sends invitation email to user' do
        email = Faker::Internet.email
        fill_in('user_email', with: email)
        click_on('Activate User')

        sleep 0.1
        open_email(email)
        expect(current_email).to have_content('Welcome to Email APP')
      end

      it 'sends invitation email with valid url' do
        email = Faker::Internet.email
        fill_in('user_email', with: email)
        click_on('Activate User')

        sleep 0.1
        open_email(email)
        current_email.click_link('EMAIL APP SYSTEM')
        expect(page).to have_content('User Information')
      end
    end

    context 'with invalid email' do
      it "shows error message \"Email can't blank\"" do
        visit '/'
        fill_in('user_email', with: nil)
        click_on('Activate User')
        expect(page).to have_content("Email can't be blank")
      end

      it "shows error message 'Email should have valid email address'" do
        visit '/'
        fill_in('user_email', with: 'xxx')
        click_on('Activate User')
        expect(page).to have_content("Email should have valid email address")
      end
    end

  end
end