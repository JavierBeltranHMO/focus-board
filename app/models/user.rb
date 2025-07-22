class User < ApplicationRecord
  # validates :username, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boards
end
