class CreateAccountActivates < ActiveRecord::Migration[5.1]
  def change
    create_table :account_activates do |t|
      t.datetime :certificated_at, null: false
      t.integer  :user_id, null: false
      t.timestamps
    end
  end
end

