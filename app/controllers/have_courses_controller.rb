class HaveCoursesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    respond_with HaveCourse.all
  end
 
  def show
    respond_with HaveCourse.find(params[:id])
  end
 
  def create
    respond_with HaveCourse.create(params[:have_course])
  end
 
  def update
    respond_with HaveCourse.update(params[:id], params[:have_course])
  end
 
  def destroy
    respond_with HaveCourse.destroy(params[:id])
  end

end
