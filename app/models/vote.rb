class Vote < ActiveRecord::Base
  attr_accessible :study_id, :vote_id, :vote_type
end
