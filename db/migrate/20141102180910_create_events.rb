class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :date
      t.string :location
      t.float :lat
      t.float :lng
      t.integer :user_id

      t.timestamps
    end
  end
end
