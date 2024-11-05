class CreateAssignedSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :assigned_sessions do |t|
      t.references :athlete, null: false, foreign_key: true
      t.date :date, null: false
      t.integer :session_type, null: false
      t.text :details

      t.timestamps
    end
  end
end
