class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :score, null: false
      t.datetime :registerd_on, null: false

      t.timestamps
    end
  end
end
