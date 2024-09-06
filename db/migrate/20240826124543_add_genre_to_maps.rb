class AddGenreToMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :maps, :genre, :string
  end
end
