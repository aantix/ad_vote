# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :study_sample do
    study_id 1
    ad_id 1
    first_verify "MyString"
    second_verify "MyString"
  end
end
