# require 'sinatra'
# get '/' do
#   "Hello World!"
# end


require 'sinatra'
require 'json'
require 'alexa_rubykit'
#
# class CustomHandler < AlexaSkillsRuby::Handler
#
#   on_launch do
#     response.set_output_speech_text("Launched!")
#     response.set_simple_card("title", "content")
#     logger.info 'LaunchIntent processed'
#   end
#
#   on_intent("GetZodiacHoroscopeIntent") do
#     slots = request.intent.slots
#     response.set_output_speech_text("Horiscope Text")
#     response.set_simple_card("title", "content")
#     logger.info 'GetZodiacHoroscopeIntent processed'
#   end
#
# end

before do
  content_type('application/json')
end

get '/' do
  "Hello World!"
end

post '/' do
  # content_type :json
  #
  # handler = CustomHandler.new(application_id: 'amzn1.ask.skill.55efad5c-72fc-45bc-aca5-9e713f352e81', logger: logger)

  # begin
  #   hdrs = { 'Signature' => request.env['HTTP_SIGNATURE'], 'SignatureCertChainUrl' => request.env['HTTP_SIGNATURECERTCHAINURL'] }
  #   handler.handle(request.body.read, hdrs)
  # rescue AlexaSkillsRuby::Error => e
  #   logger.error e.to_s
  #   403
  # end

  #request_json = JSON.parse(request.body.read.to_s)
  #halt 500 if request_json['session'].nil? || request_json['version'].nil? || request_json['request'].nil?
  #request.version = '1.0'
  request = AlexaRubykit::Response.new(request_json['request'])


  request.add_speech('Ruby is running. Ready')
  request.build_response

end
