class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    drop_table :songs
    drop_table :artists
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio

      t.timestamps
    end
  end
end
