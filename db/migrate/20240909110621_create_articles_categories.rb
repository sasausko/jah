class CreateArticlesCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :articles_categories do |t|
      t.string :name
      t.string :ancestry

      t.timestamps
    end
    add_index :articles_categories, :ancestry
  end
end
