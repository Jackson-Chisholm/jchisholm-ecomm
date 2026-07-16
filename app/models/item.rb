class Item < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "franchise", "id", "name", "price", "stock", "updated_at"]
  end
end
