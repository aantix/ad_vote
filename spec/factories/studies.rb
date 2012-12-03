# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :study do
    name "MyString"
    query "MyString"
    ad_file File.open("#{Rails.root}/data/cats.csv")
  end
end
