require 'net/http'
require 'uri'
require 'json'

class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from("chat:message")
  end

  def unsubscribed
    logger.debug("unsubscribed")
  end

  def put_message(data)

    # 画面から入力したメッセージの配信
    logger.debug(data)
    ChatChannel.broadcast_to("message", data["message"])

    # TODO: Controllerで呼ぶ
    group = Group.find(data["message"]["group_id"])

    # APIコール
    app_id = group.group_app_id || get_new_app_id(data)
    dialog_payload = {
      "language" => "ja-JP",
      "botId" => "Chatting",
      "appId" => app_id,
      "voiceText" => data["message"]["text"],
      # to_sでフォーマットするとなぜかUTCになってしまうのでstrftimeを使う
      "appRecvTime" => group.last_api_receive_time.strftime("%Y-%m-%d %H:%M:%S"),
      "appSendTime" => Time.zone.now.strftime("%Y-%m-%d %H:%M:%S"),
    }
    parse_res = apipost(API_DIALOGUE_URL, dialog_payload)

     # TODO: Controllerで呼ぶ
    group.update_attributes(group_app_id: app_id, last_api_receive_time: parse_res["serverSendTime"])

    api_response = {
      "text" => parse_res["systemText"]["expression"],
      "user_login_id" => "docomoさんのAPI",
      "group_id" => data["message"]["group_id"]
    }
    ChatChannel.broadcast_to("message", api_response)
  end

  private

    # URIとBodyを使ってPOSTリクエストを送信する。
    def apipost(req_uri, req_body)
      logger.debug("------- start apipost -------")
      logger.debug(req_uri)
      logger.debug(req_body)

      uri = URI.parse(req_uri)
      body = req_body.to_json
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      req = Net::HTTP::Post.new(uri.request_uri)
      req["Content-Type"] = "application/json;charset=UTF-8"
      req.body = body
      res = https.request(req)
      
      logger.debug("------- end apipost -------")
      logger.debug("res.body:" << res.body)
      JSON.parse(res.body)
    end

    # App Idを新規発行する
    def get_new_app_id(data)
      logger.debug("start get_app_id")
      register_payload = {
        "botId" => "Chatting",
        "appKind" => "Web Application"
      }
      response = apipost(API_REGISTER_URL, register_payload)
      response["appId"]
    end
end
