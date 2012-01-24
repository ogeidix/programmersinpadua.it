class TagsTalks < ActiveRecord::Migration
  def up
    create_table 'tags_talks', :id => false do |t|
      t.column :tag_id, :integer
      t.column :talks_id, :integer
    end
    remove_column :talks, :tag_list
  end

  def down
    add_column :talks, :tag_list, :string    
  end
end
