class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.references :study
      t.string :headline
      t.string :description1
      t.string :description2
      t.string :display_url
      t.string :redirect_url
      t.boolean :user_created, :default => false

      t.timestamps
    end
  end
end
