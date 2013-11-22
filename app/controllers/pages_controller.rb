class PagesController < ApplicationController

    #add_breadcrumb "title", :my_path, :title => "course.name"
  layout "page-application"
  def index
    add_breadcrumb "Home", :pages_path, :class => "my-class"
  end

  def nav
   add_breadcrumb "Home", :pages_path, :class => "my-class"
   add_breadcrumb Faculty.find(params[:id]).abbreviation, :class => "my-class"
  	@id = params[:id]
  	@back = false

  	if(params.has_key?(:back))
  		@back = true
  	end
  end

  def course_index
   add_breadcrumb "Home", :pages_path, :class => "my-class"

   add_breadcrumb Faculty.find(params[:id]).abbreviation, "/pages/nav/" + params[:id], :class => "my-class"
   add_breadcrumb Course.find(params[:cid]).title
    
  	@id = params[:cid]


  end
  
  def course_register
    @id = params[:id]
  end
end
