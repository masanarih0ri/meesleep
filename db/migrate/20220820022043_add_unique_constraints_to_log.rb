class AddUniqueConstraintsToLog < ActiveRecord::Migration[6.1]
  def change
    add_index :logs, [:registered_on, :user_id], unique: true
  end
end
