class RenameRegisterdOnColumnToLogs < ActiveRecord::Migration[6.1]
  def change
    rename_column :logs, :registerd_on, :registered_on
  end
end
