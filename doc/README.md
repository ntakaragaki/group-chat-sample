## 環境設定
### Windows (WSL使用)
1. Microsoft StoreからUbuntuをインストール
2. とりあえずやっておく
   ```
   sudo apt update
   sudo apt upgrade
   ```
3. 必要なパッケージをインストール
   ```
   sudo apt install -y build-essential liblzma-dev patch ruby-dev zlib1g-devlibpq-dev sqlite3 libsqlite3-dev
   ```
4. 必要なgemをインストール
   ```
   sudo gem install rails
   sudo gem install sqlite3
   bundle install
   ```

### Mac
必要になったら書くかも