class WantCoursesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    respond_with WantCourse.all
  end
 
  def show
    respond_with WantCourse.find(params[:id])
  end
 
  def create
    respond_with WantCourse.create(params[:want_course])
  end
 
  def update
    respond_with WantCourse.update(params[:id], params[:want_course])
  end
 
  def destroy
    respond_with WantCourse.destroy(params[:id])
  end

end
