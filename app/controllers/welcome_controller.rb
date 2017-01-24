require 'open-uri'
require 'cgi'
require 'json'
#require 'google/api_client'

class WelcomeController < ApplicationController
  
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token
  
  # GET /welcome
  def index
  	  
	  #apikey = 'AIzaSyANPVaEQ0I4erpjEzzcJFMHG8-EcABMoao'
	  apikey = 'AIzaSyAC-jdWZDppBm8_cP1LRA79QeChfgPr9Qs'
	  #calendarId = 'kke.co.jp_jh10o5p06igc6toeq8rerrbde8@group.calendar.google.com'
	  calendarId = 'i8a77r26f9pu967g3pqpubv0ng@group.calendar.google.com'
	  #uri = "https://www.googleapis.com/calendar/v3/calendars/#{CGI.escape(calendarId)}/events?orderBy=startTime&singleEvents=true&timeZone=Asia%2FTokyo&timeMin=#{CGI.escape(Time.now.iso8601)}&key=#{apikey}"
	  uri = "https://www.googleapis.com/calendar/v3/calendars/#{CGI.escape(calendarId)}/events/watch?key=#{apikey}"
	  puts(uri)
	  
	  
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
