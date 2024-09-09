ActiveAdmin.register Article do
  form do |f|
    f.inputs do
      f.input :title
      f.input :articles_category
      f.rich_text_area :body
    end
    f.actions
  end
end
