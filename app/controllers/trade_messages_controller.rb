class TradeMessagesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    respond_to do |format|
      format.html
      format.json { render json: TradeMessage.joins(:user).select('trade_messages.*, users.name as username').where(:trade_id => user_session[:current_trade_id]) }
    end
  end
 
  def show
    respond_with TradeMessage.find(params[:id])
  end
 
  def create
    @trade_message = TradeMessage.new(trade_message_params)
    @trade_message.trade_id = user_session[:current_trade_id]
    @trade_message.user_id = current_user.id
    if @trade_message.save
      respond_with TradeMessage.joins(:user).select('trade_messages.*, users.name as username').find(@trade_message)
    end
  end
 
  def update
    respond_with TradeMessage.update(params[:id], params[:trade_message])
  end
 
  def destroy
    respond_with TradeMessage.destroy(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_message_params
      params.require(:trade_message).permit(:content)
    end

end
