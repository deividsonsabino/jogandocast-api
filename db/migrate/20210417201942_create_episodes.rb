class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes, id: false do |t|
      t.string :id, primary_key: true
      t.string :preview_url
      t.text :description
      t.string :duration
      t.string :link
      t.string :image_url
      t.string :name

      t.timestamps
    end
  end
end
