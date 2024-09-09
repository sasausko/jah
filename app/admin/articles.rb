ActiveAdmin.register Article do
  permit_params :title, :articles_category_id, :body

  # Виключаємо body з фільтрів, оскільки Ransack не підтримує пошук по RichText
  remove_filter :body

  # Визначаємо інші фільтри, які можна використовувати
  filter :title
  filter :articles_category
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :articles_category
      f.rich_text_area :body
    end
    f.actions
  end
end
