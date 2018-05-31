App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # 表示する時刻を作成
    d = new Date
    month = d.getMonth() + 1
    date = d.getDate()
    hours = d.getHours()
    minutes = d.getMinutes()

    # TODO: _chat.html.erbを組み上げているだけ。どこかにまとめたい。
    div = document.createElement('div')
    h3 = document.createElement('h3')
    h3.textContent = data.user_login_id
    h3.className = "user-name font-weight-bold d-inline-block"
    time = document.createElement('time')
    time.textContent = "#{month}/#{date} #{hours}:#{minutes}"
    div.appendChild(h3)
    div.appendChild(time)
    span = document.createElement('span')
    span.className = "text-secondary"
    span.textContent = data.text
    li = document.createElement('li')
    li.className = "list-group-item list-group-item-action"
    li.appendChild(div)
    li.appendChild(span)
    document.getElementById('chat_list').appendChild(li)
    
    $("html,body").animate({scrollTop:$(li).offset().top});

  put_message: (msg) ->
    @perform('put_message', { message: msg })
    return
