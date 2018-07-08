class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(params[:user_id])
    @collaborator_user = User.find_by_email(params[:collaborator][:temp_user_email])
    @collaborator.user_id = @collaborator_user.id
    @collaborator.name = params[:collaborator][:name]
    if @collaborator.save
      flash[:notice] = "Collaborator was added."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error adding the collaborator."
      redirect_back(fallback_location: wikis_path)
    end
  end

  def new
    @collaborator = Collaborator.new
    @collaborator_user = User.find_by_email(params[:collaborator][:temp_user_email])
    @collaborator.user_id = @collaborator_user.id 
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = Wiki.find(params[:wiki_id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error removing collaborator"
      redirect_to @wiki
    end
  end
end
