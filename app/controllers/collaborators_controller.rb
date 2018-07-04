class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
    puts "params are #{params}"
    @collaborator_user = User.find_by_email(params[:collaborator])
    @collaborator.user_id = @collaborator_user.id 
    authorize @collaborator
    if @collaborator.save
      flash[:notice] = "Collaborator was added."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error adding the collaborator."
      render @wiki
    end
  end

  def new
    @collaborator = Collaborator.new
    puts "params are #{params}"
    @collaborator_user = User.find_by_email(params[:collaborator])
    @collaborator.user_id = @collaborator_user.id 

  end

  def edit
  end
end
