require 'sinatra'
require 'alexa_rubykit'

get '/' do
  "Hello World!"
end

post '/' do
  request = AlexaRubykit::Response.new
  request.add_speech('Ruby is running. Ready')
  request.build_response
end
