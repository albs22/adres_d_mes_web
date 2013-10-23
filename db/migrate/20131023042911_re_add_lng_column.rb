class ReAddLngColumn < ActiveRecord::Migration
  def up
    add_column :violations, :lng, :float
  end

  def down
  end
end
