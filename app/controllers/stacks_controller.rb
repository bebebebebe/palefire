class StacksController < ApplicationController

  def new
    @project = Project.find(params[:id])
    @stack = @project.stacks.new

    @current_stack = Stack.find(params[:stack_id])
    arrangement = @stack.arrangements.first
    position = arrangement.position

    #@arrangement = @stack.arrangements.build
    #@arrangement.position = position + 1
    #@arrangement.save
  end

  def create
    
    #position = @current_stack.arrangement.position + 1

    @project = Project.find(params[:project_id])


    ## refactor next lines, using params[:stack]
    @stack = @project.stacks.new#(params[:stack])
    @stack.project_id = params[:project_id]
    @stack.save

    #@arrangement = @stack.arrangements.new(params[:arrangement])
    #arrangement.position = position
    #@arrangement.save

    @card = @stack.cards.new
    @card.writing = "hi from the stacks controller"
    @card.save
    redirect_to edit_project_stack_path(id: @stack.id, project_id: @stack.project_id)
  end

                                                    

  def show
    @stack = Stack.find(params[:id])
    @project = Project.find(@stack.project_id)
    @blank_card = @stack.cards.last
    @cards = @stack.cards[0...@stack.cards.length-1]

    @top_card = params[:card]
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

end
