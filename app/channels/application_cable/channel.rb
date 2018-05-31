module ApplicationCable
  class Channel < ActionCable::Channel::Base
    API_DIALOGUE_URL = "https://api.apigw.smt.docomo.ne.jp/naturalChatting/v1/dialogue?APIKEY=" << ENV["DOCOMO_API_KEY"]
    API_REGISTER_URL = "https://api.apigw.smt.docomo.ne.jp/naturalChatting/v1/registration?APIKEY=" << ENV["DOCOMO_API_KEY"]
  end
end
