class DislikesController < ApplicationController
  before_action :set_dislike, only: [:show, :edit, :update, :destroy]

  # GET /dislikes
  # GET /dislikes.json
  def index
    @dislikes = Dislike.all
  end

  # GET /dislikes/1
  # GET /dislikes/1.json
  def show
  end

  # GET /dislikes/new
  def new
    @dislike = Dislike.new
  end

  # GET /dislikes/1/edit
  def edit
  end

  # POST /dislikes
  # POST /dislikes.json
  def create
    @dislike = Dislike.new(dislike_params)

    respond_to do |format|
      if @dislike.save
        format.html { redirect_to @dislike, notice: 'Dislike was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dislike }
      else
        format.html { render action: 'new' }
        format.json { render json: @dislike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dislikes/1
  # PATCH/PUT /dislikes/1.json
  def update
    respond_to do |format|
      if @dislike.update(dislike_params)
        format.html { redirect_to @dislike, notice: 'Dislike was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dislike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dislikes/1
  # DELETE /dislikes/1.json
  def destroy
    @dislike.destroy
    respond_to do |format|
      format.html { redirect_to dislikes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dislike
      @dislike = Dislike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dislike_params
      params[:dislike]
    end
end
