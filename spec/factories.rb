Factory.define :admin_user do |f|
  f.name "Test User"
  f.email "test@addressdmess.com" 
  f.password "foobar"
  f.password_confirmation "foobar"
  f.toggle!(:admin)
end

Factory.define :mess do |f|
  f.violation_addres "123 Fake St."
  f.violation_type "mess"
  f.date_enter Time.now
  f.description "this is a fake mess"
end



