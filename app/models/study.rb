class Study < ActiveRecord::Base
  attr_accessible :name, :query

  belongs_to :user
end
