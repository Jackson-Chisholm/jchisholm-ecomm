class Province < ApplicationRecord
  has_many :customer

  validates :name, :tax, presence: true
  validates :tax, numericality: true
  validates :name, format: { with: /\A[a-zA-Z\- ]+\z/ }
end
