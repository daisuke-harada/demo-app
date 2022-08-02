class RoomChannel < ApplicationCable::Channel
  # メッセージを送信する側(Publisher)が、特定のメッセージを受信する側(Subscriber)
  # クライアントとは？
  #クライアントとは、IT分野におけるコンピュータ間のデータ通信の役割であり、データを提供される側の役割をするコンピュータあるいはソフトウェアです。

  # 購読とよばれる
  # 購読(サブスクライバされるとこのコードが呼び出される)
  # クライアントの接続が行われた際に実行されるメソッド
  # stream_fromメソッドはAction Cableが保持しているメソッドの1つで、データの送受信を行うことができます。
  # room_channel間（room_channel.rbとroom_channel.js）でデータを送受信することができます。
  def subscribed
    stream_from "room_channel"
  end

  # 購読してない
   # クライアントの接続が解除された際に実行されるメソッド
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # room_channel.jsのreceivedメソッドにdata[‘message’]キーワード引数で送信しています。
  def speak(data)
    ActionCable.server.broadcast 'room_channel',{ message: data['message'] }
  end
end
