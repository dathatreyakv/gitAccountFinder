class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.integer :git_account_id
      t.string :repository_url

      t.timestamps
    end
  end
end
