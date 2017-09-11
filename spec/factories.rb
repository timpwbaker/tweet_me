FactoryGirl.define do
  factory :user do
    name "Tom Jones"
    email "tomjones@email.com"
    password "Password"

    trait :guest do
      name "Anonymous"
      guest true
    end
  end

  factory :message do
    user
    body "A little less conversation, a little more action please"
  end
end
