class AddImagesToViolation < ActiveRecord::Migration
  def self.up
    add_attachment :violations, :image_before
    add_attachment :violations, :image_after
  end

  def self.down
    remove_attachment :violations, :image_before
    remove_attachment :violations, :image_after
  end
end
