class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_board, only: [ :show, :edit, :update, :destroy ]

  def index
    @boards= user_signed_in? ? current_user.boards : []
  end

  def show
    @board= current_user.boards.find(params[:id])
    redirect_to boards_path, alert: "Board not found." unless @board
  end

  def new
    @board=current_user.boards.new
  end

  def create
    @board=current_user.boards.new(board_params)
    if @board.save
      redirect_to @board, notice: "Board created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: "Board updated succesfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: "Board deleted succesfully."
  end

  private

  def set_board
    @board=current_user.boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
