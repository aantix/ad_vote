class Ad < ActiveRecord::Base
  belongs_to :user
  attr_accessible :headline, :user_created, :description1, :description2, :display_url, :headline, :redirect_url
end
