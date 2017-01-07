require 'json'
class WelcomeController < ApplicationController
	
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token

  # GET /welcome
  def index
  	  # 読み込み時に一度パースが必要
	  json_request = JSON.parse(request.body.read)

	  # パース後のデータを表示
	  #p "json_request => #{json_request}"
	  #p "#{json_request.to_hash}"

	  # 各要素へのアクセス方法
	  #p "data => #{json_request["data"]}"
	  #p "data.type => #{json_request["data"]["type"]}"
  end

end
