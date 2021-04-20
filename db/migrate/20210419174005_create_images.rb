class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name
      t.text :content
      t.string :content_type
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
