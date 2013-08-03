class ArrangementsController < ApplicationController
  
  def create
    @stack = Stack.find(params[:stack_id])
    project = @stack.project
    plot = project.plots.first
    
    

  end

end
