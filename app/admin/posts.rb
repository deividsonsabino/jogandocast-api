ActiveAdmin.register Post do
  includes :author

  permit_params :title, :admin_user_id, :photo, :content, :description

  index do
    selectable_column
    id_column
    column :image do |post|
      image_tag("data:image/jpeg;base64,#{post.image.try(:content)}", size: "150x100")
    end
    column :title
    column :description
    column :author
    column :created_at
    column :update_at
    actions
  end

  filter :title
  filter :description
  filter :author
  filter :content

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :title
      f.input :description
      f.input :author
      f.input :photo, as: :file, hint: f.object.try(:image).present? ? image_tag(url_for(f.object.image)) : content_tag(:span, 'no image yet')
      f.input :content, as: :quill_editor
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :author
      row :content do |c|
        c.content.html_safe
      end
      row :image do |ad|
        image_tag url_for(ad.image)
      end
    end
  end
end