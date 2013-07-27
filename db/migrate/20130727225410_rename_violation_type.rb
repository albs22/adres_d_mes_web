class RenameViolationType < ActiveRecord::Migration
  def up
     remove_column :violations, :violation_type 
  end

  def down
  end
end
