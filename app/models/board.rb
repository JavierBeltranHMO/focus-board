class Board < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :lists, dependent: :destroy
  def index
    if user_signed_in?
      @boards=current_user.boards
    else
    end
  end
end
