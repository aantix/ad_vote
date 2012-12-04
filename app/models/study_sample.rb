class StudySample < ActiveRecord::Base
  attr_accessible :ad_id, :first_verify, :second_verify, :study_id

  belongs_to :study
  belongs_to :ad
end
