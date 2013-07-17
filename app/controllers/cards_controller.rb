class CardsController < ApplicationController

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @stack = Stack.find_by_id(@card.stack_id)

    @next_card = Card.new(params[:card])
    @next_card.stack_id = @card.stack_id
    @next_card.save
    redirect_to edit_card_path(@next_card)
  end

end
