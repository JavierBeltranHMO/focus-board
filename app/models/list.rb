class List < ApplicationRecord
  validates :name, presence: true
  belongs_to :board
  has_many :tasks
  accepts_nested_attributes_for :tasks, allow_destroy: true

  include RankedModel
  ranks :row_order
end
