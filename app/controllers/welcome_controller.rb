require 'json'
class WelcomeController < ApplicationController
	
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token

  # GET /welcome
  def index
  	  # 読み込み時に一度パースが必要
	  json_request = JSON.parse(request.body.read)
	  
      if !json_request.blank?
      	personal = json_request
      else
      	personal = {'status' => 500}
      end

      render :json => personal
      
      
  end

end
