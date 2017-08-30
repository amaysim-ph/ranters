FactoryGirl.define do
  factory :ranter do
    email { Faker::Internet.email }
    handle { Faker::Internet.user_name }
    password 'password'
    password_confirmation 'password'
  end
end
