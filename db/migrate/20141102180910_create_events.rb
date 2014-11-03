class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :date
      t.references :location

      t.timestamps
    end
  end
end
