class StacksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @stack = @project.stacks.create(params[:stack])
    @stack.position = params[:stack_position].to_i + 1
    @stack.save
    @stack.inc_following

    @card = @stack.cards.create
    pick = @stack.build_pick
    pick.card_id = @card.id
    pick.save

    redirect_to edit_project_stack_path(id: @stack.id, project_id: @stack.project_id)
  end                                              

  def show
    @stack = Stack.find(params[:id])
    @project = Project.find(@stack.project_id)
    @blank_card = @stack.cards.last
    @cards = @stack.cards[0...@stack.cards.length-1]
    @pick = @stack.pick
  end

  def edit
    @stack = Stack.find(params[:id])
    @project = Project.find(@stack.project_id)
    @card = @stack.cards.first

    @new_stack = Stack.new
  end

  def destroy
    @stack = Stack.find(params[:id])
    project = Project.find(@stack.project_id)
    @stack.destroy
    redirect_to project_path(project)
  end

  def update
    @stack = Stack.find(params[:id])
    pick = Pick.find_by_stack_id(@stack.id)
    pick.card_id = params[:pick_me]
    pick.save
    redirect_to stack_path(@stack)
  end

end
