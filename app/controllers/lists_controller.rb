# app/controllers/lists_controller.rb
class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = @board.lists.rank(:row_order)
  end

  def sort
    @list=List.find(params[:id])
    @list.update(row_order_position: params[:row_order_position])
    head :no_content
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = @board.lists.new
    1.times { @list.tasks.build }
  end

  # GET /lists/1/edit
  def edit
      @list.tasks.build if @list.tasks.empty?
  end

  # POST /lists or /lists.json
  def create
    @list = @board.lists.new(list_params)

      if @list.save
        @list.tasks.each { |t| puts "#{t.id}: #{t.name}" }

        redirect_to @board, notice: "List was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
      if @list.update(list_params)
        @list.tasks.each { |t| puts "#{t.id}: #{t.name}" }

        redirect_to @board, notice: "List was successfully updated."
      else
         render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy!

    redirect_to @board, status: :see_other, notice: "List was successfully destroyed."
  end

  private

    def set_board
      @board=Board.accesible_by(current_user).friendly.find(params[:board_id])
      authorize @board
    end

    def set_list
      @list = @board.lists.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, tasks_attributes: [ :id, :name, :_destroy ])
    end
end
