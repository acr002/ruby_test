
require 'open-uri'

url = 'http://rooter.jp'

OpenURI.open_uri(url) do |a|

  # 文字列にする
  # p a.read

  # 文字コード
  p a.charset

  # URIの取得
  p a.base_uri

  # ヘッダの内容を取得
  p a.content_encoding

  # 最終更新時刻を取得
  p a.last_modified

  # ヘッダ情報をハッシュで取得する
  p a.meta
end


