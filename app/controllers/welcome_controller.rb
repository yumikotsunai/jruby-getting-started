require 'open-uri'
require 'cgi'
require 'json'

class WelcomeController < ApplicationController
  
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token
  
  
  # GET /welcome
  def index
  	  
  	  apikey = 'AIzaSyANPVaEQ0I4erpjEzzcJFMHG8-EcABMoao'
  	  calendarId = 'kke.co.jp_jh10o5p06igc6toeq8rerrbde8@group.calendar.google.com'
  	  
  	  uri = "https://www.googleapis.com/calendar/v3/calendars/#{CGI.escape(calendarId)}/events?orderBy=startTime&singleEvents=true&timeZone=Asia%2FTokyo&timeMin=#{CGI.escape(Time.now.iso8601)}&key=#{apikey}"
	  
	  if !request.body.read.blank?
	      
          p JSON.parse(open(uri).read)
  	  
	      #ヘッダ取得
	      #header1 = response.headers
		  #puts("ヘッダ");
		  #puts(header1);
		  
	      #Parameters取得
		  #data = request[:data];
		  #type = data["type"];
		  #if type == "locked_event"
		  #	  e = "ロック"
		  #else
		  #	  e = "その他"
		  #end
		  
		  #puts('イベント : ' + e);
		  
	  else
	  	  render
	  end
	  
  end

end
