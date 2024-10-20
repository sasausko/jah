class Article < ApplicationRecord
  belongs_to :articles_category
  has_rich_text :body
  has_many_attached :images

  def self.ransackable_associations(auth_object = nil)
    [ "articles_category" ]
  end


  def self.ransackable_attributes(auth_object = nil)
    [ "articles_category_id", "created_at", "id", "title", "updated_at" ]
  end
end
