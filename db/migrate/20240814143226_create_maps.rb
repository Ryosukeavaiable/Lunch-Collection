class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :title
      t.string :body
      t.string :photo
      t.integer :user_id
      t.timestamps
    end
  end
end
