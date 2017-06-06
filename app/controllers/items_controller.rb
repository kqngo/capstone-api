# frozen_string_literal: true

class ItemsController < ProtectedController
  # before_action :set_item, only: [:show, :update, :destroy]
  before_action :set_item, only: [:update, :destroy]

  # GET /items
  def index
    @items = Item.all

    render json: @items
  end

  def myitems
    @items = Item.where("user_id=#{current_user.id}")
    render json: @items
  end

  # GET /items/1
  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  # POST /items
  def create
    # @item = Item.new(item_params)
    @item = current_user.items.build(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    # @item = Item.find(params[:id])
    @item = current_user.items.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:title, :location, :body, :category_id, :user_id)
  end
end
