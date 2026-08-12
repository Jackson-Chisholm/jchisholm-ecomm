class Order < ApplicationRecord
  belongs_to :customer

  validates :status, :items, :customer_id, :order_total, presence: true
  validates :order_total, :customer_id, numericality: true
  validates :status, :items, format: {with: /\A[a-zA-Z0-9_:,.\- ]+\z/}
end
