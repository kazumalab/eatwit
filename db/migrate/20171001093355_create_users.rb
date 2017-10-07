class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :self_introduction
      t.string :profile_image
      t.string :password_digest

      t.timestamps
    end
    add_index :users, %i[name email], unique: true
  end
end

