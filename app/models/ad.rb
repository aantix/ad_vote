class Ad < ActiveRecord::Base
  PRICE    = 0.02

  DURATION = 5
  LIFETIME = 1

  NUM_ASSIGNMENTS = 20

  belongs_to :study

  attr_accessible :headline, :user_created, :description1, :description2, :display_url, :headline, :redirect_url

  has_many :votes, :as => :vote

  has_many :turkee_tasks, :class_name => Turkee::TurkeeTask, :foreign_key => 'ad_id', :dependent => :destroy

  def create_turk_study(query)
    study_sample = StudySample.create!(:ad_id => self.id, :study_id => self.study.id)
    turkee_task  = Turkee::TurkeeTask.create_hit(TURKEE_URL, turk_title(query),
                                                 turk_description(query), "Vote",
                                                 NUM_ASSIGNMENTS, PRICE, LIFETIME, DURATION,
                                                 {}, {:study_sample_id => study_sample.id})

    turkee_task.ad_id = self.id
    turkee_task.save!
  end

  def status
    return "Unstarted." if turkee_tasks.size == 0

    completed = turkee_tasks.all? {|t| t.complete?}
    completed ? "Complete" : "In progress"
  end

  private

  def turk_title(query)
    "Which link would you click on if you did a search for '#{query}'?"
  end

  def turk_description(query)
    "If you did a search for '#{query}', which search result would you click on next?"
  end

end
