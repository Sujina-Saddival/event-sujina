FactoryGirl.define do
	factory :user do 
	email { FFaker::Internet.email }
    password "123example"
    firstname "Arpitha"
    lastname "mahesh"
    username "Arpitha"
    phone "1234567890"
  end
end