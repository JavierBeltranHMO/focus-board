class User < ApplicationRecord
  # validates :username, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boards
  has_many :board_memberships
  has_many :shared_boards, through: :board_memberships, source: :board
end
