require 'unicorn'
require 'sidekiq'
require 'sinatra'
require 'newrelic_rpm'

get '/' do
	'Home page'
end

class BackgroundTask
	include Sidekiq::Worker

	def perform
		sleep 5
		puts 'Goodnight'
	end
end

BackgroundTask.perform_async