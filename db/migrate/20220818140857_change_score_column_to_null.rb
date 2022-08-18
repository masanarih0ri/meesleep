class ChangeScoreColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :logs, :score, true
  end

  def down
    change_column_null :logs, :score, false
  end
end
