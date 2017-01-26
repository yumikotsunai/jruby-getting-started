
class ReceiveController < ApplicationController
  
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token
  
  # GET/POST /webhook
  def webhook
  end
  
  def webhookreceive
  	  #必要なのがhttpsなのでSSLを有効にする。とりあえず証明書は無視。
      ctx      = OpenSSL::SSL::SSLContext.new
      ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      #postするデータを作成しておく
      channelId = SecureRandom.uuid()
      
      postbody = {
	      "id": channelId,
	      "type": "web_hook",
	      "address": "https://whispering-harbor-83926.herokuapp.com/receive/webhook/",
      }
      
      #ヘッダーに認証用の情報をつけておく
      #HTTP.post(URL)でURLにpostリクエストを送る（送ってresにレスポンスを取得。）
      res = HTTP.headers("Content-Type" => "application/json",:Authorization => "Bearer ya29.GlvfA8j2_V74mXuGK9OtiA_UEWjAi90bHzfc8gei75mpz1beLiizSl3jTgz_AFcTRN5w7YKb5sbp0I_ad6TfIFObClHv4iwae4vF_PKrsfLpaCOeEj5qd7YRxjxd")
      .post("https://www.googleapis.com/calendar/v3/calendars/yumikokke@gmail.com/events/watch", :ssl_context => ctx , :body => postbody.to_json)
      
      puts('レス')
  	  puts(res)
  	  puts('レス2')
  end
  
end
