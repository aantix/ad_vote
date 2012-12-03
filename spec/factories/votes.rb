# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    study_id 1
    vote_type "MyString"
    vote_id 1
  end
end
