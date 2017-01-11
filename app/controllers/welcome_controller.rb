require 'json'

class WelcomeController < ApplicationController
  
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token
  
  
  # GET /welcome
  def index
  	  # 読み込み時に一度パースが必要
	  #json_request = JSON.parse(request.body.read)
	  
	  
	  #print(1);
	  #print(request["data"]);
	  print(2);
	  data = request["data"];
	  print(data["type"]);
	  
	  #print(request["data"]["type"]);
	  #print(request["data"]["attributes"]);
	  
	  @info = request["data"]
      
  end

end
