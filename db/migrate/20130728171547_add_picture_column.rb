class AddPictureColumn < ActiveRecord::Migration
  def up
    add_column :violations, :photo_name, :string
  end

  def down
  end
end
