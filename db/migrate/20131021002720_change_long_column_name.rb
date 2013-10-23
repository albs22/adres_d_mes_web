class ChangeLongColumnName < ActiveRecord::Migration
  def up
    remove_column :violations, :long, :float
  end

  def down
    add_column :violations, :lng, :float
  end
end