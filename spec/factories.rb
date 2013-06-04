FactoryGirl.define do 
  factory :user do
    name      "aname example"
    email     "aname@example.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end