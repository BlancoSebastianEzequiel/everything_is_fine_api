require 'sinatra'
require 'sinatra/json'
require_relative 'sinatra_ssl'
require 'json'

set :bind, '0.0.0.0'
set :ssl_certificate, 'localhost.crt'
set :ssl_key, 'localhost.key'
set :port, 3002

FILE_BASE='/home/gbordanzi/trabajo/keepcon/everythin_is_fine_api'

get '/frank-says' do
	json(foo: 'Put this in your pipe & smoke it!')
end

post '/event_flow_test' do
	body = JSON.parse(request.body.read)

	open("#{FILE_BASE}/event_flow_test", 'a') do |file|
		file.puts(body.to_json)
		file.puts("\n")
	end
	json(status: 'received', detail: 'all green')
end
