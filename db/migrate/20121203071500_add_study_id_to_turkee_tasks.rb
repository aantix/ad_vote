class AddStudyIdToTurkeeTasks < ActiveRecord::Migration
  def change
    add_column :turkee_tasks, :ad_id, :integer, :after => :id
  end
end
