class BoardMembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    board=Board.friendly.find(params[:board_id])
    authorize board, :add_collaborator?

    user=User.find_by(email: params[:email])
    if user
      board.collaborators << user unless board.collaborators.include?(user)
      redirect_to board, notice: "#{user.email} added"
    else
      redirect_to board, alert: "User not found"
    end
  end
end
