require 'sinatra'
require 'mqtt'
require 'json'

mqtt_client = MQTT::Client.connect('localhost') 

get '/' do
	puts "user joined"
  File.read(File.join('public', 'index.html'))
end

post '/api/control' do
    request.body.rewind
    control_data = JSON.parse request.body.read
  	mqtt_client.publish('throttle', control_data["throttle"])
  	mqtt_client.publish('steering', control_data["steering"])
end