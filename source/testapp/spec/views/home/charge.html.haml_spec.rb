require 'rails_helper'

RSpec.describe "home/charge.html.erb", :type => :view do
  before(:each) do

    # To Make all tables empty
    Customer.delete_all
    Charge.delete_all


    # To Seed 4 Customers into the system:
    @customer1 = FactoryGirl.create :customer   
    @customer2 = FactoryGirl.create :customer   
    @customer3 = FactoryGirl.create :customer   
    @customer4 = FactoryGirl.create :customer   


    # To Seed 20 transactions (charges) into the system:
      # 10 Should be successful transactions:
        #   - 5 Should be linked to Customer 1
        5.times do
          FactoryGirl.create :success_transaction, :customer => @customer1
        end

        #   - 3 Should be linked to Customer 2
        3.times do
          FactoryGirl.create :success_transaction, :customer => @customer2
        end

        #   - 1 Should be linked to Customer 3
        FactoryGirl.create :success_transaction, :customer => @customer3

        #   - 1 Should be linked to Customer 4
        FactoryGirl.create :success_transaction, :customer => @customer4



      # 5 Should be transactions that failed:
        #   - 3 Should be linked to Customer 3
        3.times do
          FactoryGirl.create :failure_transaction, :customer => @customer3
        end

        #   - 2 Should be linked to Customer 4
        2.times do
          FactoryGirl.create :failure_transaction, :customer => @customer4
        end


      # 5 should be disputed:
        #   - 3 should be linked to Customer 1
        3.times do
          FactoryGirl.create :disputed_transaction, :customer => @customer1
        end

        #   - 2 should be linked to customer 2
        3.times do
          FactoryGirl.create :disputed_transaction, :customer => @customer2
        end

    visit "/home/charge"
  end

  it "has 3 lists" do
    expect(page).to have_selector('h1', count:3)
  end

  it "has 10 success transactions" do
    check_transactions 'success'
  end

  it "has 5 failure transactions" do
    check_transactions 'failed'
  end

  it "has 5 dispute transactions" do
    check_transactions 'disputed'
  end

  def check_transactions trans_status
    charges = nil

    if trans_status == 'success'
      charges = Charge.success
    elsif trans_status == 'failed'
      charges = Charge.failed
    elsif trans_status == 'disputed'
      charges = Charge.disputed
    end

    charges.each do |charge|
      find("div.#{trans_status} table tbody tr.list[data-charge-id=\"#{charge.id}\"] td", text: charge.customer.name)
      find("div.#{trans_status} table tbody tr.list[data-charge-id=\"#{charge.id}\"] td", text: charge.amount.to_s)
      find("div.#{trans_status} table tbody tr.list[data-charge-id=\"#{charge.id}\"] td", text: charge.created_at.to_s)
    end
  end

  
end
