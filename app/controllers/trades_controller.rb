class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:mktr,:detail,:edit]
  def list
    @trades = Trade.all
  end

  def detail
    @trade = Trade.find(params[:id])
  end

  def mktr#make trade
    @trade = Trade.new
    if Trade.where(user_id: current_user.id,item_id: params[:item_id]).empty?
      @trade.user_id = current_user.id
      @trade.item_id = params[:item_id]
    end

    respond_to do |format|
      if Item.find(params[:item_id]).user_id == current_user.id
        format.html {redirect_to(item_path(params[:item_id]),:flash=>{:error => "자신의 물품에 거래신청 할 수 없습니다"})}
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      elsif @trade.save
        format.html { redirect_to(trade_detail_path(@trade.id), :flash => {:success => "거래 신청이 완료되었습니다."}) }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { redirect_to(trade_detail_path(Trade.where(user_id:current_user.id,item_id:params[:item_id]).last.id), :flash => {:error => "이미 거래신청을 하셨습니다."})}
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end

  end
end
