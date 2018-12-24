class AgentsController < ApplicationController
  def home
  end
  
  def show
    if current_agent
      @agent = Agent.find(params[:id])
    elsif current_admin
      @package = Package.find(params[:id])
      @agent = @package.agent
    end
  end
end