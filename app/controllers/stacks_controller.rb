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
    @project = Project.find(@stack.project_id)
    @blank_card = @stack.cards.last
    @cards = @stack.cards[0...@stack.cards.length-1]
  end

  def destroy
  end

end
