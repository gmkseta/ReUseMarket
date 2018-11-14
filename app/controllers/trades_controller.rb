class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:mktr,:detail,:edit]
  def list
    @trades = Trade.all
  end
  def my_list
    @purchases = Trade.where("customer_id = #{current_user.id}")
    @sells = Trade.where("seller_id = #{current_user.id}")
  end

  def detail
    @trade = Trade.find(params[:id])
  end

  def mktr#make trade
    @trade = Trade.new
    i_id = params[:item_id]
    if Trade.where(customer_id: current_user.id,item_id: i_id).empty?
      @trade.customer_id = current_user.id
      @trade.seller_id = Item.find(i_id).user_id
      @trade.item_id = i_id
    end

    respond_to do |format|
      if Item.find(i_id).user_id == current_user.id
        format.html {redirect_to(item_path(i_id),:flash=>{:error => "자신의 물품에 거래신청 할 수 없습니다"})}
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      elsif @trade.save
        format.html { redirect_to(trade_detail_path(@trade.id), :flash => {:success => "거래 신청이 완료되었습니다."}) }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { redirect_to(trade_detail_path(Trade.where(customer_id: current_user.id,item_id: i_id).last.id), :flash => {:error => "이미 거래신청을 하셨습니다."})}
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end

  end
end
