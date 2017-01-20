FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "string#{n}" }
    sequence(:body) { |n| "#{n} My post body text must be minimum of 20 characters long" }
  end
end
