class PagesController < ApplicationController
  def home
  end

  def help
  end

  def contact
  end
  
  def destinations
    if current_agent
      redirect_to(root_path, alert: "Agent can't access this page") and return 
    else
      @countries = Country.all.order('name')
    end
  end
  
end
