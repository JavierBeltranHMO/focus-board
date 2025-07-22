class List < ApplicationRecord
  validates :name, presence: true
  belongs_to :board
  has_many :tasks

  include RankedModel
  ranks :row_order
end
