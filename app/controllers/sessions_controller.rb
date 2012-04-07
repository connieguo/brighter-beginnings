class SessionsController < ApplicationController

  def create
    #remove this comment when implement User model method
    #@user = User.find_or_create_from_auth_hash(auth_hash)
    #redirect_to '/'
    @hash = auth_hash
    return render:text => "Authentication hash received: #{@hash.inspect}"
  end
  
  protected
  
  def auth_hash
    request.env['omniauth.auth']
  end

end
