class ChangeViolationType < ActiveRecord::Migration
  def up
    remove_column :violations, :violation_type, :string
  end

  def down
    add_column :violations, :violation_type, :string
  end
end
