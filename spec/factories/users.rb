FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "example#{n}"} 
    sequence(:email) { |n| "example#{n}@foobar.com"}
    password "foobar"
    password_confirmation "foobar"
  end
end
