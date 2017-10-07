class CreateUserSocialAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_social_accounts do |t|
      t.integer :user_id
      t.integer :social_account_id

      t.timestamps
    end
  end
end

