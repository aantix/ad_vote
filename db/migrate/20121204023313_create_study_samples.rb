class CreateStudySamples < ActiveRecord::Migration
  def change
    create_table :study_samples do |t|
      t.integer :study_id
      t.integer :ad_id
      t.string :first_verify
      t.string :second_verify

      t.timestamps
    end
  end
end
