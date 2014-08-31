FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@addressdmess.com" 
    password "foobar"
    password_confirmation "foobar"
  end

  factory :violation do
   lat 88.00
   lng 112.00
   violation_address "123 Fake St."
   violation_type "mess"
   description "this is a fake mess"
   status "open"
  end

end
