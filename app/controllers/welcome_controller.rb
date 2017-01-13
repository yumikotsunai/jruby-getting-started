require 'json'

class WelcomeController < ApplicationController
  
  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  skip_before_filter :verify_authenticity_token
  
  
  # GET /welcome
  def index
  	  # 読み込み時に一度パースが必要
	  #json_request = JSON.parse(request.body.read)
	  
	  if !request.body.read.blank?
	      
	      #ヘッダ取得
	      header1 = response.headers
	      header2 = response.headers['Content-Type']
	      header3 = response.headers['X-Secret']
	      header4 = response.headers['X-Content-Type-Options']
	      
	      #JSONのオリジナル取得
	      #json_request = response.raw_post
	      
	      #FORMのオリジナル取得
	      #form_request = response.raw_post
	      
		  puts("ヘッダ");
		  puts(header1);
		  puts(header2);
		  puts(header3);
		  puts(header4);
		  #puts("JSONオリジナル");
		  #puts(json_request);
		  #puts("FORMオリジナル");
		  #puts(form_request);
	      
	      
	      #Parameters取得
		  data = request["data"];
		  #data = request[:data];
		  type = data["type"];
		  #type = data[:type];
		  
		  #attributes = data["attributes"];
		  #source = attributes["source"];
		  #status = attributes["status"];
		  #time_zone = attributes["time_zone"];
		  #occurred_at = attributes["occurred_at"];
		  #created_at = attributes["created_at"];
		  #updated_at = attributes["updated_at"];
		  #nmethod = attributes["method"];
		  #publisher_id = attributes["publisher_id"];
		  #publisher_type = attributes["publisher_type"];
		  #source = attributes["source"];
		  
		  #nid = data["id"];
		  
		  #links = data["links"];
		  #nself = links["self"];
		  #publisher = links["publisher"];
		  
		  
		  #puts(data);
		  #puts(type);
		  #puts(attributes);
		  #puts(source);
		  #puts(status);
		  #puts(time_zone);
		  #puts(occurred_at);
		  #puts(created_at);
		  #puts(updated_at);
		  #puts(nmethod);
		  #puts(publisher_id);
		  #puts(publisher_type);
		  #puts(source);
		  #puts(nid);
		  #puts(links);
		  #puts(nself);
		  #puts(publisher);
		  
		  if type == "locked_event"
		  	  e = "ロック"
		  else
		  	  e = "その他"
		  end
		  
		  #puts('イベント : ' + e);
		  
		  
	  else
	  	  #@event = 'イベント : '
	  	  render :text => 'イベント : ' 
	  	  
	  end
	  
	  
  end

end
