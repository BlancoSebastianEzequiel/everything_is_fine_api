require 'sinatra'
require 'sinatra/json'
require 'json'

require_relative 'sinatra_ssl'
require_relative 'sinatra_auth'

set :bind, '0.0.0.0'
set :ssl_certificate, 'localhost.crt'
set :ssl_key, 'localhost.key'
set :port, 3002

FILE_BASE='/home/gbordanzi/trabajo/keepcon/everythin_is_fine_api'

get '/frank-says' do
	json(foo: 'Put this in your pipe & smoke it!')
end

post '/event_flow_test' do
	begin
		protect! username: 'everything', password: 'is_fine'

		body = JSON.parse(request.body.read)

		open("#{FILE_BASE}/event_flow_test", 'a') do |file|
			file.puts(body.to_json)
			file.puts("\n")
		end
		json(status: 'received', detail: 'all green')
	rescue => e
		open("#{FILE_BASE}/unexpected_errors", 'a') do |file|
			file.puts(e)
			file.puts(e.backtrace)
			file.puts("\n\n\n\n\n\n\n")
		end
		json(status: 'todo mal ameo', detail: 'en algun lado la cagaste')
	end
end
