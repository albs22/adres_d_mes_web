class AddDateClosed < ActiveRecord::Migration
  def change
     add_column :violations, :date_closed, :date
  end
end
