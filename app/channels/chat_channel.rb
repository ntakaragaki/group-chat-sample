require 'net/http'
require 'uri'
require 'json'

class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat:message'
  end

  def unsubscribed
    logger.debug "デバッグ情報"
  end

  def put_message(data)

    logger.debug(data)
    ChatChannel.broadcast_to('message', data['message'])
    res = apipost(data)
    parse_res = JSON.parse(res.body)
    logger.debug("APIからのレスポンス↓")
    logger.debug(parse_res)

    api_response = {
      "text" => parse_res["systemText"]["expression"],
      "user_login_id" => "docomoさんのAPI",
      "group_id" => "1"
    }
    logger.debug(api_response)
    ChatChannel.broadcast_to('message', api_response)
  end

  private 
    def apipost(data)
 
      uri = URI.parse(API_DIALOGUE_URL)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      req = Net::HTTP::Post.new(uri.request_uri)
      
      req["Content-Type"] = "application/json;charset=UTF-8" # httpリクエストヘッダの追加
      payload = {
          "language" => "ja-JP",
          "botId" => "Chatting",
          "appId" => APP_ID,
          "voiceText" => data['message']['text'],
          "appRecvTime" => "2015-05-05 13:30:00",
          "appSendTime" => "2015-05-05 13:31:00",
      }.to_json
      req.body = payload
      res = https.request(req)
    end
end
