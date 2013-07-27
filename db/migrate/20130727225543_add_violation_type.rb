class AddViolationType < ActiveRecord::Migration
  def up
    add_column :violations, :violation_type, :float
  end

  def down
  end
end
