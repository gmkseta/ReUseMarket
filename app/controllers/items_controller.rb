class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  #유저로 로그인이 되어있어야 한다 . only ~ 얘네 액션을 할 때에는 .
  before_action :authenticate_user!, only: [:destroy,:new,:edit]

  # GET /items
  # GET /items.json
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result
    puts params[:q]

  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: '물품이 성공적으로 등록 되었습니다' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: '물품이 성공적으로 수정 되었습니다.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: '물품이 삭제 되었습니다.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      pra = params.require(:item).permit(:name, :price, :item_image, :category,:content,item_images:[])
      pra["category"]= pra["category"].to_i
      return pra
    end
end
