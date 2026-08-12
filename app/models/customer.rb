class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :order
  belongs_to :province

  validates :name, :address, :email, :province_id, presence: true
  validates :province_id, numericality: true
  validates :name, format: {with: /\A[a-zA-Z]+\z/}
  validates :address, format: {with: /\A[A-Za-z0-9\- ]+\z/}
  validates :email, format: { with: /\A([A-Za-z0-9]+[._+-]?)*[A-Za-z0-9]+@([A-Za-z0-9-]+\.)+[A-Za-z]{2,6}\z/i }
  validates :password, format: {with: /\A[a-z0-9_\-]+\z/i}, allow_nil: true
end
