class AddSlugToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :slug, :string
    add_index :bikes, :slug
  end
end
