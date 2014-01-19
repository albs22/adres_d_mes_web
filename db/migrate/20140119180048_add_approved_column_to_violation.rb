class AddApprovedColumnToViolation < ActiveRecord::Migration
  def change
    add_column :violations, :approved, :boolean, default: false
  end
end
