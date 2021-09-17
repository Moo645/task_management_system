class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.string :status
      t.integer :rank
      t.datetime :deleted_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
