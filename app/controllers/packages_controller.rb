class PackagesController < ApplicationController
  #before_action :authenticate_agent! , except: [:index, :show]
  #before_action :authenticate_admin! , only: [:index, :show]
  
  before_action do
    if current_agent
      authenticate_agent!
    elsif current_admin
      authenticate_admin!
    end
  end
   
  def home
  end
  
  def index
    if current_agent
      @package=current_agent.packages
    elsif current_admin
        @package=Package.all
    end
  end
  
  def packages_agent
    @agent = Agent.find(params[:id])
    @package = @agent.packages
  end

  def new
    @package=current_agent.packages.build
  end
  
  def show
    @package=Package.find(params[:id])
  end

  def edit
    @package=Package.find(params[:id])
  end
  
  def create
      @package = current_agent.packages.new(package_params)   
      if @package.save
        flash[:success] = "New Tour Package Created"
        redirect_to @package
      else
        render 'new'
      end
  end
  
  def update
    @package = Package.find(params[:id])
      if @package.update_attributes(package_params)
        flash[:success] = "Tour Package updated"
              redirect_to @package
      else
        render 'edit'
      end
  end
  
  def destroy
      Package.find(params[:id]).destroy
      flash[:success] = "Tour Package Deleted"
      redirect_to packages_path
  end
  
  def package_params
        params.require(:package).permit(:name, :days, :nights, :departure, :country_id, :province_id, :itinerary, :price, :includes)
  end
  
  
  def approval
    if current_admin
      @package=Package.approved?
    else
      redirect_to root_path
    end
  end
  
  def approve
    @package = Package.find(params[:id])
      if @package.update_attribute(:approved, true)
        flash[:success] = "Tour Package Approved for Publishing"
              redirect_to @package
      else
        render 'approval'
      end
  end
  
  def search
    if params[:country].blank? 
       redirect_to(root_path, alert: "Empty field!") and return  
     else
        @package = params[:country].downcase 
        @results = Package.all.where("lower(country_id) LIKE ?" ,"%#{@package}%") 
     end 
  end
      
end
