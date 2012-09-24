class PagesController < ApplicationController
  def index
  end
  
  def signout
    reset_session
    redirect_to :action => "home" #redirect to the homepage
  end
end
