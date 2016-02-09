class AddLocationToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :location, :string
    add_index :bikes, :location
  end
end
