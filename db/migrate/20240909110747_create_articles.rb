class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :articles_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
