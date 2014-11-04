FactoryGirl.define do

  factory :user do
    name "Test User"
    email "test2@addressdmess.com" 
    password "foobar"
    password_confirmation "foobar"
  end

  factory :testuser do
    name "Harri Seldon"
    email "harri@addressdmess.com"
    password "terminus"
    password_confrimation "terminus"
  end

  factory :violation do
   lat 88.00
   lng 112.00
   violation_address "123 Fake St."
   violation_type "mess"
   description "this is a fake mess"
   status "open"
  end
  
  factory :location do
    address "123 Fake St."
    lat 89.00
    lng 113.00
  end
  
  factory :event do
    title "Test Event"
    description "Test your events"
    date { DateTime.now }
    user_id FactoryGirl.build(:user).id
    location_id FactoryGirl.build(:location).id
  end

  
end
 


