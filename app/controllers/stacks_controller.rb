class StacksController < ApplicationController

  def new
    @project = Project.find(params[:id])
    @stack = @project.stacks.new
  end

  def create
    @stack = Stack.new(params[:stack])
    @stack.project_id = params[:project_id]
    @stack.save
    @card = @stack.cards.new
    @card.pick = true
    @card.save
    redirect_to edit_card_path(@card)
  end

  def show
    @stack = Stack.find(params[:id])
    @project = Project.find(@stack.project_id)
    @blank_card = @stack.cards.last
    @cards = @stack.cards[0...@stack.cards.length-1]

    @top_card = params[:card]
  end

  def destroy
    @stack = Stack.find(params[:id])
    project = Project.find(@stack.project_id)
    @stack.destroy
    redirect_to project_path(project)
  end

  

end
