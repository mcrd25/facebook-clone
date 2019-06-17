class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :notification_types, :type, :name
  end
end
