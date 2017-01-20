FactoryGirl.define do
  factory :comment do
    sequence(:name) { |n| "#{n} name" }
    sequence(:body) { |n| "comment body string" }
    post nil
  end
end
