ActiveAdmin.register Post do
  # belongs_to :author

  index do
    selectable_column
    id_column
    column :title
    column :content
    column :author
    column :created_at
    column :update_at
    actions
  end
end