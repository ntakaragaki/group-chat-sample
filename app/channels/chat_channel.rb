class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat:message'
  end

  def unsubscribed
    logger.debug "デバッグ情報"
  end

  def put_message(data)
    ChatChannel.broadcast_to('message', data['message'])
  end
end
