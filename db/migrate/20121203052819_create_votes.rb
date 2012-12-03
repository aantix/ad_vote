class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :study_id
      t.string :vote_type
      t.integer :vote_id

      t.timestamps
    end
  end
end
