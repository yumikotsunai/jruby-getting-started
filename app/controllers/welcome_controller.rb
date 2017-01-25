require 'open-uri'
require 'cgi'
require 'json'
require 'google/api_client'
require 'http'

class WelcomeController < ApplicationController
  
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token
  
  # GET /welcome
  def index
  	  #必要なのがhttpsなのでSSLを有効にする。とりあえず証明書は無視。
      ctx      = OpenSSL::SSL::SSLContext.new
      ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      #postするデータを作成しておく
      channelId = SecureRandom.uuid()
      
      #postbody = {
	  #    "id": channelId,
	  #    "type": "web_hook",
	  #    "address": "https://whispering-harbor-83926.herokuapp.com/",
      #}
      
      #ヘッダーに認証用の情報をつけておく
      #HTTP.post(URL)でURLにpostリクエストを送る（送ってresにレスポンスを取得。）
      #res = HTTP.headers("Content-Type" => "application/json",:Authorization => "Bearer ya29.GlveAxOICYS3rJfArLM6KhxJH5FXi7U6RRM1Tf2uFq5dSORu5ZSzaZxfoJ1lPYzX-lxKZ0FqqqqfjbduNsYOTXAo5Wb4PTPYZXO8cs6Wo__ocZ5A5Ifc8IGYn2Rn")
      #.post("https://www.googleapis.com/calendar/v3/calendars/yumikokke@gmail.com/events/watch", :ssl_context => ctx , :body => postbody.to_json)
      
  	  #puts(res)
  	  
  	  
  	  
  	  client = Google::APIClient.new
	  client.authorization.client_id = '841258018012-jqn06q4ifmfvbj5ip42rvtemetcga7oj.apps.googleusercontent.com'
	  client.authorization.client_secret = 'HuQ43i5_NiqOeOIZca4oJttJ'
	  client.authorization.refresh_token = '1/7nJCwG-bQpw6UZKXexw3WPEsPbkbX4eAgFcpqP18uvo'
	  client.authorization.fetch_access_token!
	  
	  service = client.discovered_api('calendar', 'v3')
	  
	  res = client.execute!(
	  	api_method: service.events.watch,
	  	parameters: { calendarId: 'i8a77r26f9pu967g3pqpubv0ng@group.calendar.google.com' },
	  	body_object: {
	  		id: channelId,
	  	    type: 'web_hook',
	  	    address: 'https://whispering-harbor-83926.herokuapp.com/'
	  	}
	  )
	  
	  puts(res)
  	  
  	  #render
  	  
	  #uri = "https://www.googleapis.com/calendar/v3/calendars/#{CGI.escape(calendarId)}/events?orderBy=startTime&singleEvents=true&timeZone=Asia%2FTokyo&timeMin=#{CGI.escape(Time.now.iso8601)}&key=#{apikey}"
	  #uri = "https://www.googleapis.com/calendar/v3/calendars/#{CGI.escape(calendarId)}/events/watch?key=#{apikey}"
	  #puts(uri)
	  
	  #begin
	  #	  open(uri) { 
	  #	  puts(open(uri).read)
	  #}
	  #rescue => e
	  #	puts e # 例外メッセージ表示
	  #	render
	  #end
	  
	  
	  #if !request.body.read.blank?
	  #if !open(uri).read.blank?
	      
	      #puts('googleテスト2')
	      #puts(open(uri).read)
	      #puts(JSON.parse(open(uri).read))
	      
	      #ヘッダ取得
	      #header1 = response.headers
		  #puts("ヘッダ");
		  #puts(header1);
		  
	      #Parameters取得
		  #data = request[:data];
		  #type = data["type"];
		  
	  #else
	  	  #puts('googleテスト1')
	  	  #render
	  #end
	  
  end

end
