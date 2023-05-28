class PackagesController < ApplicationController
 
  def index
    packages = Package.all

    @list_of_packages = packages.order({ :created_at => :desc })

    render({ :template => "packages/show.html.erb" })
  end

  #def show
   # the_id = params.fetch("path_id")

   # matching_packages = Package.where({ :id => the_id })

    #@the_package = matching_packages.at(0)

   # render({ :template => "packages/show.html.erb" })
 # end

  def create

    @new_package = Package.new
    @new_package.description = params.fetch("description")
    @new_package.arrive_on = params.fetch("arrive_on")
    @new_package.details = params.fetch("details")
    @new_package.status = params.fetch("query_status")
    @new_package.user_id = session.fetch(:user_id)

    @new_package.save
   #just adding individual fetchings since I can define each one of the
   #things I need 
   
    #@the_package.content = params.fetch("query_content")
    #the_package.status = params.fetch("query_status")
    
    redirect_to("/", {:notice=>"Added to list"})

  end

  def update
    
    package = Package.find(params[:path_id])
    current_status = params.fetch("query_status")
    package.status = current_status
    package.save
    
    redirect_to("/")
    #the_id = params.fetch("path_id")
    #the_package = Package.where({ :id => the_id }).at(0)

    #he_package.content = params.fetch("query_content")
    #the_package.status = params.fetch("query_status")
    #the_package.user_id = params.fetch("query_user_id")



   #if the_package.valid?
    # the_package.save
    #  redirect_to("/packages/#{the_package.id}", { :notice => "Package updated successfully."} )
    #else
      #redirect_to("/packages/#{the_package.id}", { :alert => the_package.errors.full_messages.to_sentence })
   # end
  end

  def destroy
    package_id = params.fetch("path_id")
    package_delete = Package.where({ :id => package_id}).at(0)

   package_delete.destroy
   
   redirect_to("/")

  end
end
