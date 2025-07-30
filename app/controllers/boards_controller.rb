# app/controllers/boards_controller.rb
class BoardsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  before_action :set_board, only: [ :show, :edit, :update, :destroy ]
  after_action :verify_authorized, except: [ :index, :new, :create ]

  def index
    owned_boards=Board.where(user: current_user).pluck(:id)
    shared_boards=Board.joins(:board_memberships).where(board_memberships: { user_id: current_user.id }).pluck(:id)
    board_ids=(owned_boards+shared_boards).uniq
    @boards=Board.where(id: board_ids)
  end

  def show
    authorize @board
    # @board= current_user.boards.friendly.find(params[:id])
    # redirect_to boards_path, alert: "Board not found." unless @board
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
    authorize @board
  end

  def update
    authorize @board
    if @board.update(board_params)
      redirect_to @board, notice: "Board updated succesfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @board
    @board.destroy
    redirect_to boards_path, notice: "Board deleted succesfully."
  end

  private

  def set_board
    @board=Board.accesible_by(current_user).friendly.find(params[:id])
    authorize @board
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
