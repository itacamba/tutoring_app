class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :avatar
      t.boolean :is_tutor

      t.timestamps
    end
  end
end
