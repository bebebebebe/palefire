class CardsController < ApplicationController

  def edit
    @card = Card.find(params[:id])
    @current_stack = Stack.find(@card.stack_id)
    @project = Project.find(@current_stack.project_id)
    @stack = Stack.new
    
    prev_stack = @current_stack.prev
    if prev_stack
      @prev_card = prev_stack.cards.first
    end
    next_stack = @current_stack.next
    if next_stack
      @next_card = next_stack.cards.first
    end
  end

  def update
    @card = Card.find(params[:id])
    @stack = Stack.find_by_id(@card.stack_id)

    @card.pick = false
    @card.save

    @next_card = Card.new(params[:card])
    @next_card.stack_id = @card.stack_id
    @next_card.pick = true
    
    @next_card.save
    #if @next_card.save
      
    #end

    redirect_to edit_card_path(@next_card)
  end


  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    stack = Stack.find(@card.stack_id)
    redirect_to stack_path(stack)
  end

  def choose

    #@card = Card.find(params[:id])
    
    #respond_to do |format|
    #    format.js { render 'somepartial' }
    #end
    redirect_to stacks_path(@stack)
     
  end

end