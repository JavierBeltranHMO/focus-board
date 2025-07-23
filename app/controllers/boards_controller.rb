class BoardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards=current_user.boards
  end

  def show
    @board= current_user.boards.find(params[:id])
  end

  def new
    @board=current_user.boards.new
  end

  def create
    @board=current_user.boards.new(board_params)
    if @board.save
      redirect to @board, notice: "Board created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
end
