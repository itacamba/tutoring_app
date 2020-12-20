class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :tutor_id
      t.integer :student_id
      t.integer :subject_id
      t.datetime :date

      t.timestamps
    end
  end
end
