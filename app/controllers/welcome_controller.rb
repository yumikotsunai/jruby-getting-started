class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	  render :text: request.headers['User-Agent']
  	  
  end

end
