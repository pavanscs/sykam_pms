class AddAttachmentImageToAttachements < ActiveRecord::Migration[6.0]
  def self.up
    change_table :attachements do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :attachements, :image
  end
end
