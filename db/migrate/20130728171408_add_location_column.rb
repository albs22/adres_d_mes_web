class AddLocationColumn < ActiveRecord::Migration
  def up
    add_column :violations, :violation_address, :string
  end

  def down
  end
end
