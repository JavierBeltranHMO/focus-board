class Board < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :lists, -> { rank(:row_order) }, dependent: :destroy
  has_many :board_memberships
  has_many :collaborators, through: :board_memberships, source: :user

  extend FriendlyId
  friendly_id :name, use: :slugged

  def index
    if user_signed_in?
      @boards=current_user.boards
    end
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
