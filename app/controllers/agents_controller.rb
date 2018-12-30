class AgentsController < ApplicationController
  def home
  end
  
  def index
    @agent = Agent.all
  end
  
  def show
    if current_agent
     @agent = Agent.find(params[:id])
    elsif current_admin
      cont=Rails.application.routes.recognize_path(request.referrer) 
      if cont[:controller] == 'agents'
        @agent = Agent.find(params[:id])
      else
        @package = Package.find(params[:id])
        @agent = @package.agent
      end
    end
  end
  
end