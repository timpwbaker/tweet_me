class AddAttachedImageToMessages < ActiveRecord::Migration[5.1]
  def up
    add_attachment :messages, :attached_image
  end

  def down
    remove_attachment :messages, :attached_image
  end
end
