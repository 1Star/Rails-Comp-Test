require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET charge" do
    it "returns http success" do
      get :charge
      expect(response).to be_success
    end
  end

end
