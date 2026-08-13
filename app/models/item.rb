class Item < ApplicationRecord

  has_one_attached :avatar

  def self.ransackable_associations(auth_object = nil)
    [ "avatar_attachment", "avatar_blob" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "franchise", "id", "name", "price", "stock", "updated_at" ]
  end
  validates :name, :description, :franchise, :price, :stock, presence: true
  validates :price, :stock, numericality: true
  validates :name, :description, :franchise, format: { with: /\A[a-zA-Z_é\- ]+\z/ }
end
