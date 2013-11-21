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

  def search_query
    @courses = Course.autocomplete(params[:f],params[:q])
    
    respond_to do |format|
      format.json { render :query }
    end
  end

  def curriculum_query
    @courses = Curriculum.find(params[:id]).courses.where("year LIKE ? AND semester LIKE ?", "#{params[:year]}", "#{params[:semester]}")

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
end
