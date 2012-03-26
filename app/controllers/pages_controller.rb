class PagesController < ApplicationController
  def index
  end
  
  def signout
    session[:uid] = nil #Logs out the user
    redirect_to :action => "home" #redirect to the homepage
  end
  
  def donor
    #@all_sizes = Family.get_sizes()
    @sizes = params[:sizes]
    @families = Family.find(:all)
    #@families = Family.find(:all).select{|f| @sizes != nil && ( @sizes.include?(f.size.to_s) || @sizes.include?("5+") && f.size > 5)}.sort_by{|f| f.size}
  end
end
