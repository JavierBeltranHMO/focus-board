class List < ApplicationRecord
  validates :name, presence: true
  belongs_to :board
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
     slug.blank? || will_save_change_to_name?
  end

  include RankedModel
  ranks :row_order
end
