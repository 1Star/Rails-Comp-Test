require 'rails_helper'

RSpec.describe "users/sign_up.html.haml", :type => :view do
  describe 'redirects to home page without valid invitation token' do
    it {
      @user = FactoryGirl.create(:invited_user)

      visit sign_up_users_path(email: @user.email, invitation_token: SecureRandom.uuid)
      expect(page).not_to have_content('User Information')
    }
  end

  describe 'Clicking continue button to sign up' do
    before :each do
      @user = FactoryGirl.create(:invited_user)

      visit sign_up_users_path(email: @user.email, invitation_token: @user.invitation_token)
    end

    after :each do
      @user.destroy
    end

    context 'with valid first name, last name and phone' do
      it 'redirects to new Tour Information Page' do

        fill_in('user_first_name', with: Faker::Name.first_name)
        fill_in('user_last_name', with: Faker::Name.last_name)
        fill_in('user_phone', with: Faker::PhoneNumber.phone_number)
        click_on('Continue')

        expect(page).to have_content('Tour Information')
      end
    end

    context 'without first name' do
      it "shows error message \"First name can't be blank\"" do
        fill_in('user_first_name', with: nil)
        click_on('Continue')
        expect(page).to have_content("First name can't be blank")
      end
    end

    context 'without last name' do
      it "shows error message \"Last name can't be blank\"" do
        fill_in('user_last_name', with: nil)
        click_on('Continue')
        expect(page).to have_content("Last name can't be blank")
      end
    end

    context 'without phone number' do
      it "shows error message \"Phone can't be blank\"" do
        fill_in('user_phone', with: nil)
        click_on('Continue')
        expect(page).to have_content("Phone can't be blank")
      end
    end
  end

end