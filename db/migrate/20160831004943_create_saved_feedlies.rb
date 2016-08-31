class CreateSavedFeedlies < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_feedlies do |t|
      t.string :source
      t.string :headline
      t.text :url
      t.datetime :pub_date
      t.text :pic
      t.text :keywords
      t.text :lead
      t.integer :topic_id
      t.string :story_type
      t.boolean :home_feature
      t.boolean :home_main
      t.boolean :home_main_pic
      t.boolean :home_right
      t.boolean :topic_feature
      t.boolean :topic_pic

      t.timestamps
    end
  end
end
