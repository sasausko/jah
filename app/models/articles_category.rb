class ArticlesCategory < ApplicationRecord
  has_ancestry
  has_many :articles

   def self.ransackable_attributes(auth_object = nil)
    [ "ancestry", "created_at", "id", "name", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "articles", "parent", "children" ]
  end
end
