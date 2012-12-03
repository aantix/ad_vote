# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ad do
    user_id 1
    headline "MyString"
    description1 "MyString"
    description2 "MyString"
    display_url "MyString"
    redirect_url "MyString"
  end
end
