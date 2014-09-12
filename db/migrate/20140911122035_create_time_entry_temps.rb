class CreateTimeEntryTemps < ActiveRecord::Migration
  def change
    create_table :time_entry_temps do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :issue_id
      t.float :hours
      t.string :comments
      t.integer :activity_id
      t.date :spent_on

      t.timestamps
    end
  end
end
