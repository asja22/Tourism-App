class PackagesController < ApplicationController
  before_action :authenticate_agent!, except: [:index, :show]
  
  def home
  end
  
  def index
    @package=current_agent.packages
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
  
end
