class AddAttachmentImageToBikes < ActiveRecord::Migration
  def self.up
    change_table :bikes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bikes, :image
  end
end
