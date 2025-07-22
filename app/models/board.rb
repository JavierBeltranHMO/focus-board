class Board < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :lists, dependent: :destroy
end
