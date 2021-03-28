ActiveAdmin.register Post do
  includes :author

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

  filter :title
  filter :author
  filter :content

  form do |f|
    f.inputs do
      f.input :title
      f.input :author
      f.input :content, as: :quill_editor
    end
    f.actions
  end
end