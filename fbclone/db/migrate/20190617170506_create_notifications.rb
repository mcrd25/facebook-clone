class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :notification_type_id
      t.integer :reference_id

      t.timestamps
    end
    add_index :notifications, :notification_type_id
    add_index :notifications, :reference_id
  end
end
