class CardsController < ApplicationController

  def edit
    @card = Card.find(params[:id])
    @current_stack = Stack.find(@card.stack_id)
    @project = Project.find(@current_stack.project_id)
    @stack = Stack.new
  end

  def update
    @card = Card.find(params[:id])
    @stack = Stack.find_by_id(@card.stack_id)

    @next_card = Card.new(params[:card])
    @next_card.stack_id = @card.stack_id
    @next_card.save
    redirect_to edit_card_path(@next_card)
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    stack = Stack.find(@card.stack_id)
    redirect_to stack_path(stack)
  end

end