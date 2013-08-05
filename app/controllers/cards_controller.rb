class CardsController < ApplicationController

  def edit
    @card = Card.find(params[:id])
    @stack = Stack.find(@card.stack_id)
    @project = Project.find(@stack.project_id)
    @new_stack = Stack.new

    redirect_to edit_stack_path(@stack)
  end

  def update
    @card = Card.find(params[:id])
    @stack = Stack.find_by_id(@card.stack_id)
    @card.save

    @next_card = Card.new(params[:card])
    @next_card.stack_id = @card.stack_id
    @next_card.save


    pick = Pick.find_by_stack_id(@stack.id)
    pick.card_id = @next_card.id
    pick.save
    
    redirect_to edit_card_path(@next_card)
  end


  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    stack = Stack.find(@card.stack_id)
    redirect_to stack_path(stack)
  end

end