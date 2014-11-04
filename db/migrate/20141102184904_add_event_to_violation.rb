class AddEventToViolation < ActiveRecord::Migration
  def change
    add_column :violations, :event_id, :integer
  end
end
