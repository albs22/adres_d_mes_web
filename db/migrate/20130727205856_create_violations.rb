class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
   
      t.datetime :date_entered
      t.string :type
      t.string :status
      t.string :description


      t.timestamps
    end
  end
end
