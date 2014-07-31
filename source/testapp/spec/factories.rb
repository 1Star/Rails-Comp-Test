FactoryGirl.define do
  factory :customer do
    sequence(:first_name) { |n| "First Name #{n}" }
    sequence(:last_name) { |n| "Last Name #{n}" }
    created_at Time.now

  end

  factory :charge do
    sequence(:amount) { |n| n * 10 }
    currency 'usd'
    refunded false
    paid false
    created_at Time.now

    factory :success_transaction do
      paid true
      refunded false
    end

    factory :disputed_transaction do
      paid true
      refunded true
    end

    factory :failure_transaction do
      paid false
    end
  end

end