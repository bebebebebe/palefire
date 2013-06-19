class ProjectsController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:success] = "new writing project started!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

end