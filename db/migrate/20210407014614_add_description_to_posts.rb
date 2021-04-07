class AddDescriptionToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :description, :string
  end
end
