class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.integer :user_id
      t.string :name
      t.string :query

      t.timestamps
    end
  end
end
