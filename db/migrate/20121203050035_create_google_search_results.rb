class CreateGoogleSearchResults < ActiveRecord::Migration
  def change
    create_table :google_search_results do |t|
      t.integer :study_id
      t.string :title
      t.string :display_url
      t.string :redirect_url
      t.text :description

      t.timestamps
    end
  end
end
