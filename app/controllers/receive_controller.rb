
class ReceiveController < ApplicationController
  
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token
  
  # GET/POST /webhook
  def webhook
  end
  
  def webhookreceive
  end
  
end
