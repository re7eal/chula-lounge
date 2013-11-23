class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]


# GET /courses
  # GET /courses.json
def index
      @courses = Course.all
 end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @teaches = @course.teaches.group_by &:year
    @m = {}
    @teaches.each do |k,v|
      @m[k] = []
      @teaches[k].each do |i|
        @m[k].push(Professor.find(i.professor_id))
      end
    end

    @teaches = @m

    @comments = @course.comments
    @users = []

    @comments.each do |i|
      c = Comment.find(i.id)   
    end
  end

  def query

  end

  def rate
    @course = Course.find(params[:course_id])

    if user_signed_in?
      @rating = Rating.find_or_initialize_by_user_id(current_user.id)
      @rating.update_attributes({
          :know_rating => rating_params.know_rating,
          :diff_rating => rating_params.diff_rating,
          :grade_rating => rating_params.grade_rating
        })

      if @rating.save
        render json: @course.ratings
      else
        render json: @rating.errors, status: :unprocessable_entity 
    else
      head :bad_request
    end
  end

  def search_query
    @courses = Course.autocomplete(params[:f],params[:q])
    
    respond_to do |format|
      format.json { render :query }
    end
  end

  def curriculum_query
     @courses = Course.joins(:curriculums).where("curriculums.id = ? AND year = ? AND semester = ?",
      "#{params[:id]}","#{params[:year]}", "#{params[:semester]}")
    respond_to do |format|
      format.json { render :query}
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST
  def register
    @course = Course.new(course_params)
      ts = []
      params2[:teaches].each do |tc|
        tc[:professors].each do |p|
          t = Teach.new({:year=> tc[:year]})
          t.professor = Professor.find(p[:id])
          ts.push(t)
        end
      end
      cs = []
      params2[:curriculums].each do |c|
        cs.push(Curriculum.find(c[:id]))
      end
      @course.teaches = ts
      @course.curriculums = cs

    respond_to do |format|
      if @course.save
        format.json { render json: @course}
      else
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end

  end
  
  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit!
    end
    def params2
      params.permit!
    end
    def rating_params
      params.require(:rating).permit(:know_rating, :diff_rating, :grade_rating, :course_id, :user_id)
    end
end
