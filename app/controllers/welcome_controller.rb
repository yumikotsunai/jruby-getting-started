require 'json'
require 'logger'

class WelcomeController < ApplicationController
	
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token
  
  #logインスタンス生成
  log = Logger.new('C:\Users\tsunai\Documents\WebHook\jruby-getting-started\log\debug.log')

  # GET /welcome
  def index
  	  # 読み込み時に一度パースが必要
	  json_request = JSON.parse(request.body.read)
	  log.debug('test')
	  log.debug(json_request)
	  
      if !json_request.blank?
      	personal = json_request
      else
      	personal = {'status' => 500}
      end

      render :json => personal
      
      
  end

end
