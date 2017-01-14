FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}}@email.com"}
    sequence(:password) { |n| "#{n}password"}
  end
end
