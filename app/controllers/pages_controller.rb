class PagesController < ApplicationController

    #add_breadcrumb "title", :my_path, :title => "course.name"
  layout "page-application"
  def index
    add_breadcrumb "Home", :pages_path
  end

  def nav
   add_breadcrumb "Home", :pages_path
   add_breadcrumb Faculty.find(params[:id]).abbreviation,
  	@id = params[:id]
  	@back = false

  	if(params.has_key?(:back))
  		@back = true
  	end
  end

  def course_index
   add_breadcrumb "Home", :pages_path

   add_breadcrumb Faculty.find(params[:id]).abbreviation, "/pages/nav/" + params[:id]
   add_breadcrumb Course.find(params[:cid]).title
    
  	@id = params[:cid]


  end
  
  def course_register
  end
end
