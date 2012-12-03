class Vote < ActiveRecord::Base
  attr_accessible :ad_id, :vote_id, :vote_type

  belongs_to :study, :counter_cache => true
  belongs_to :vote, :polymorphic => true
end
