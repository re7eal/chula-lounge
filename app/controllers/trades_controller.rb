class TradesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_trade, only: [:show, :edit, :update, :destroy, :data]

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.order(:id).reverse_order.limit(10).offset((params[:page].to_i-1)*10)
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
    user_session[:current_trade_id] = @trade.id
  end

  # GET /trades/new
  def new
    @trade = Trade.new
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(:note => params[:note])
    @trade.finished = false
    @trade.user_id = current_user.id

    respond_to do |format|
      if @trade.save
        unless params[:have_courses].nil?
          params[:have_courses].each do |course|
            @have_course = HaveCourse.new(course)
            @have_course.trade_id = @trade.id
            unless @have_course.save
              format.html { render action: 'new' }
              format.json { render json: @have_course.errors, status: :unprocessable_entity }
            end
          end
        end
        unless params[:want_courses].nil?
          params[:want_courses].each do |course|
            @want_course = WantCourse.new(course)
            @want_course.trade_id = @trade.id
            unless @want_course.save
              format.html { render action: 'new' }
              format.json { render json: @want_course.errors, status: :unprocessable_entity }
            end
          end
        end

        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render json: @trade }
      else
        format.html { render action: 'new' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        format.html { redirect_to @trade, notice: 'Trade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url }
      format.json { head :no_content }
    end
  end

  def data
    @user_name = @trade.user.name
    @trade_messages = @trade.trade_messages
    @have_courses = @trade.have_courses
    @want_courses = @trade.want_courses

    respond_to do |format|
      format.html { render :json => {:user_name => @user_name, :trade_messages => @trade_messages, :have_courses => @have_courses, :want_courses => @want_courses }}
      format.json { render :json => {:user_name => @user_name, :trade_messages => @trade_messages, :have_courses => @have_courses, :want_courses => @want_courses }}
    end
  end

  def my_trades
    @trades = Trade.where(:user_id => current_user.id)
  end

  def search
    @trades_notes = Trade.search_by_note(params[:search])
    @trades_have_courses = Trade.search_by_have_courses(params[:search])
    @trades_want_courses = Trade.search_by_want_courses(params[:search])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:note, :finished)
    end
end
