class ReAddViolationType < ActiveRecord::Migration
  def up
   add_column :violations, :violation_type, :string
  end

  def down
  end
end
