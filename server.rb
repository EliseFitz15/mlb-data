require 'sinatra'
require 'sinatra/json'
require 'pry'
require 'dotenv'

Dotenv.load

require 'net/http'

get '/mlb/v2/JSON/teams' do

  uri = URI('http://api.nfldata.apiphany.com/mlb/v2/JSON/teams')

  uri.query = URI.encode_www_form({
     # Specify your subscription key
     'subscription-key' => ENV['SUBSCRIPTION_KEY'],
  })

  request = Net::HTTP::Get.new(uri.request_uri)

  response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
  end

  puts response.body

end
