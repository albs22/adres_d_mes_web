class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.float :lat
      t.float :lng   
      t.datetime :date_entered
      t.datetime :date_closed
      t.string :description
      t.string :status
      t.string :violation_address
      t.string :violation_type
      t.timestamps
    end
  end
end
