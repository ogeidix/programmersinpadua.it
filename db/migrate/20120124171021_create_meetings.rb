class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.date :when
      t.text :description

      t.timestamps
    end
  end
end
