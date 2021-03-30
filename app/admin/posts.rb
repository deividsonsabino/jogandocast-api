ActiveAdmin.register Post do
  includes :author

  permit_params :title, :admin_user_id, :image, :content

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
    f.semantic_errors

    f.inputs do
      f.input :title
      f.input :author
      f.input :image, as: :file
      f.input :content, as: :quill_editor
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :image do |ad|
        image_tag url_for(ad.image)
      end
    end
  end
end