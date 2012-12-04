class AddVoteCountToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :votes_count, :integer, :default => 0
  end
end
