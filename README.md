# Group chat sample

## Demo
https://safe-refuge-52228.herokuapp.com/

Login account
- testuser1 / foobar
- testuser2 / foobar
- testuser3 / foobar

ユーザーの新規登録はできません。

# 概要
- docomo社から提供されている[自然対話API](https://dev.smt.docomo.ne.jp/?p=docs.api.page&api_name=natural_dialogue&p_name=api_usage_scenario)とグループチャットをするアプリケーションです。
- 複数ユーザーの画面を同期するために、Ruby on Rails 5 で追加されたAction Cable(Websocket)を使用しています。 
- チャット履歴は保存され、途中参加した人もログを追えるようになっています。