class AgentsController < ApplicationController
  def home
  end
  
  def index
    if current_admin
      @agent = Agent.all
    else
      redirect_to root_path
    end
  end
  
  def show
    if current_agent
     @agent = Agent.find(params[:id])
    elsif current_admin
      cont=Rails.application.routes.recognize_path(request.referrer) 
      if cont[:controller] == 'agents'
        @agent = Agent.find(params[:id])
      elsif cont[:controller] == 'packages'
        @package = Package.find(params[:id])
        @agent = @package.agent
      end
    end
  end
  
end