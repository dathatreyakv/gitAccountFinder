class CreateGitAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :git_accounts do |t|
      t.string :user_id
      t.string :user_name, null: false
      t.string :profile_url
      t.string :location

      t.timestamps
    end

    add_index :git_accounts, :user_name, unique: true

  end
end
