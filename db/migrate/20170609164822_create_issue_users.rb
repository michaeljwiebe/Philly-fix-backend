class CreateIssueUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :issue_users do |t|
      t.integer :issue_id
      t.integer :user_id

      t.timestamps
    end
  end
end
