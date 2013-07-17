class StacksController < ApplicationController

  def new
    @project = Project.find(params[:id])
    @stack = @project.stacks.build
  end

  def create
    @stack = Stack.new(params[:stack])
    @stack.project_id = params[:project_id]
    @stack.save
    @card = @stack.cards.create
    redirect_to edit_card_path(@card)
  end

  def show
    @stack = Stack.find(params[:id])
  end

  def destroy
  end

end
