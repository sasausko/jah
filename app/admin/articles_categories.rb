ActiveAdmin.register ArticlesCategory do
  permit_params :name, :parent_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :parent, as: :select, collection: ArticlesCategory.all.collect { |c| [ c.name, c.id ] }
    end
    f.actions
  end
end
