class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:mktr,:detail,:edit]
  def list
  end

  def detail

  end

  def mktr#make trade
    @trade = Trade.new
    if Trade.where(user_id: current_user.id,item_id: params[:item_id]).empty?
      @trade.user_id = current_user.id
      @trade.item_id = params[:item_id]
    end

    respond_to do |format|
      if @trade.save
        format.html { redirect_to trade_detail_path(@trade.id), notice: '거래 신청이 완료 되었습니다.' }
        format.json { render :show, status: :created, location: @trade }
      else
        format.html { redirect_back fallback_location: item_path(params[:item_id]), warning: "이미 거래 신청하셨습니다."}
        format.json { render json: t.errors, status: :unprocessable_entity }
      end
    end

  end
end
