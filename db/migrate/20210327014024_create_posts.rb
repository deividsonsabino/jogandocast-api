class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :admin_user, foreign_key: { to_table: :admin_users }

      t.timestamps
    end
  end
end
