class PagesController < ApplicationController
  def index
  end
  
  def signout
    session[:uid] = nil #Logs out the user
    redirect_to :action => "home" #redirect to the homepage
  end
  
  def donor
    @all_sizes = Family.get_sizes()
    @sizes = params[:size]
    @selected_sizes = @sizes || session[:size] || @all_sizes
    if @sizes != session[:size]
      session[:size] = @selected_sizes
    end
    @families = Family.find(:all).select{|f| @selected_sizes != nil  && ( @selected_sizes.include?(f.size.to_s) || ( @selected_sizes.include?("6 or more") && f.size > 5) )}.sort_by{|f| f.size}
  end
end
