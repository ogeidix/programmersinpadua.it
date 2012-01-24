class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.references :user
      t.string :title
      t.text :description
      t.string :tag_list
      t.references :meeting

      t.timestamps
    end
    add_index :talks, :user_id
    add_index :talks, :meeting_id
  end
end
