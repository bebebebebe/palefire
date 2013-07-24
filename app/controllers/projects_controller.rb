class ProjectsController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      @stack = @project.stacks.create
      @card = @stack.cards.create

      flash[:success] = "new writing project started!"
      redirect_to edit_card_path(@card)
    else
      render 'static_pages/home'
    end
  end

  def show
    @project = Project.find(params[:id])
    @stack = Stack.new
    @user = User.find(@project.user_id)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.stacks.each {|s| s.destroy}
    @project.destroy
    
    flash[:success] = "project deleted"
    redirect_to current_user
  end



end