class SingosController < ApplicationController
  before_action :set_singo, only: [:show, :edit, :update, :destroy]

  # GET /singos
  # GET /singos.json
  def index
    @singos = Singo.all
  end

  # GET /singos/1
  # GET /singos/1.json
  def show
    raise ActionController::RoutingError.new('Not Found')
    #scaffold 로 자동생성
  end

  # GET /singos/new
  def new
    @singo = Singo.new
  end

  # GET /singos/1/edit
  def edit
    #scaffold 로 자동생성
  end

  # POST /singos
  # POST /singos.json
  def create
    @singo = Singo.new(singo_params)

    respond_to do |format|
      if @singo.save
        format.html { redirect_to(@singo.item,:flash=>{:error => "신고가 정상적으로 완료 되었습니다."})}
        format.json { render :show, status: :created, location: @singo }
      else
        format.html { render :new }
        format.json { render json: @singo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /singos/1
  # PATCH/PUT /singos/1.json
  def update
    respond_to do |format|
      if @singo.update(singo_params)
        format.html { redirect_to @singo, notice: 'Singo was successfully updated.' }
        format.json { render :show, status: :ok, location: @singo }
      else
        format.html { render :edit }
        format.json { render json: @singo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /singos/1
  # DELETE /singos/1.json
  def destroy
    @singo.destroy
    respond_to do |format|
      format.html { redirect_to singos_url, notice: 'Singo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_singo
      @singo = Singo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def singo_params
      params.require(:singo).permit(:content, :user_id, :item_id, :sel)
    end
end
