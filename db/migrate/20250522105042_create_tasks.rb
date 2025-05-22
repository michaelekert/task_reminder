class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :meeting_at
      t.string :email

      t.timestamps
    end
  end
end
