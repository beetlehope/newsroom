FactoryBot.define do 
	factory :user do 
		sequence(:email) { |n| "test#{n}@sample.com" }
		password "password"

		trait :editor do
			editor true
		end	
	end 
end	