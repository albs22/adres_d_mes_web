class ChnageLongColumn < ActiveRecord::Migration
  def up
    remove_column :violations, :long, :float
    remove_column :violations, :lng, :float
  end

  def down
    add_column :violations, :lng, :float
  end
end
