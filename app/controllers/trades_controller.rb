class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:mktr,:detail,:edit]
  before_action :is_trader, only: [:detail]


  def list
    @trades = Trade.all
  end
  def my_list
    @purchases = Trade.where("customer_id = #{current_user.id}")
    @sells = Trade.where("seller_id = #{current_user.id}")
  end

  def detail
    @chats = @trade.chats
    @chat = Chat.new
    case @trade.status
    when "거래 중"
      @print_text="현재 판매자와 거래중입니다."
      @subline_text="판매자 정보를 통해 판매자와 연락 후 거래하세요 통화가 어려울 경우 1:1 대화함 서비스를 이용하세요."
    when "수령 완료"
      if current_user == @trade.seller
        @print_text="구매자가 물품 수령 완료 하였습니다."
        @subline_text="물품이 판매 완료되었으면 판매 완료 버튼을 누르세요"
      else
        @print_text="물품 수령 완료 하였습니다."
        @subline_text="판매자가 구매 완료를 할때까지 기다려주세요"
      end
    when "판매 완료"
      if current_user == @trade.customer
        @print_text="판매자가 물품 인계 완료 하였습니다."
        @subline_text="물품이 수령 완료되었으면 인수 완료 버튼을 누르세요"
      else
        @print_text="물품 판매 완료 하였습니다."
        @subline_text="구매자가 수령완료를 할때까지 기다려주세요"
      end
    when "거래 완료"
      @print_text="거래가 완료되었습니다."
      @subline_text="거래에 문제가 발생했을 경우 신고버튼을 눌러주세요"
    when "거래 취소"
      @print_text="거래가 취소되었습니다."
      @subline_text="거래에 문제가 발생했을 경우 신고버튼을 눌러주세요"
    else
      @print_text="거래에 문제가 발생."
      @subline_text="거래에 문제가 발생했을 경우 신고버튼을 눌러주세요"
    end

  end

  def mktr#make trade
    @trade = Trade.new
    i_id = params[:item_id]

    @trade = Trade.where(customer_id: current_user.id,item_id: i_id).last
    is_empty = @trade.nil?
    if is_empty
      @trade.customer_id = current_user.id
      @trade.seller_id = Item.find(i_id).user_id
      @trade.item_id = i_id
    end

    respond_to do |format|
      if Item.find(i_id).user_id == current_user.id
        format.html {redirect_to(item_path(i_id),:flash=>{:error => "자신의 물품에 거래신청 할 수 없습니다"})}
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      elsif (not is_empty) and ( @trade.status=="거래 취소")
        @trade.update(status:"거래 중")
        format.html { redirect_to(trade_detail_path(@trade.id), :flash => {:success => "거래 취소를 하였으나 다시 거래신청을 하셨습니다."})}
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      elsif not is_empty
        format.html { redirect_to(trade_detail_path(@trade.id), :flash => {:error => "이미 거래신청을 하셨습니다."})}
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      else
        @trade.save
        format.html { redirect_to(trade_detail_path(@trade.id), :flash => {:success => "거래 신청이 완료되었습니다."}) }
        format.json { render :show, status: :created, location: @trade }
      end
    end

  end

  def update_status
    trade = Trade.find(params[:id])
    trade.change_status(current_user)
    redirect_to trade_detail_path(trade)
  end
  def cancel
    trade = Trade.find(params[:id])
    trade.cancel_trade()
    redirect_to trade_detail_path(trade)

  end
  def update_review
    trade = Trade.find(params[:id])
    pra = params.require(:trade).permit(:review_content,:score)
    trade.update(pra)
    redirect_to trade_detail_path(trade)

  end

  private
   def is_trader
     @trade = Trade.find(params[:id])
     if @trade.customer_id == current_user.id
       @is_seller = false
     elsif @trade.seller_id == current_user.id
       @is_seller = true
     else
       redirect_to(:root,:flash=>{:error => "자신의 거래가 아닙니다"})
     end
   end

end
