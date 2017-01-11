require 'json'

class WelcomeController < ApplicationController
  
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token
  
  
  # GET /welcome
  def index
  	  # 読み込み時に一度パースが必要
	  #json_request = JSON.parse(request.body.read)
	  
	  print(request["data"]);
	  print(request["data"]["type"]);
	  print(request["data"]["attributes"]);
	  
	  @info = request["data"]
      
  end

end
