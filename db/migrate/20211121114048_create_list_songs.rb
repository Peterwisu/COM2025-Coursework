class CreateListSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :list_songs do |t|
      t.belongs_to :playlist, foreign_key: true
      t.belongs_to :song, foreign_key: true

      t.timestamps
    end
  end
end
