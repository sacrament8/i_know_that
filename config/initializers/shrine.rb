require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/avatar/cache"), # キャッシュファイル置き場を指定
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/avatar"),       # 画像保存先を指定
}

Shrine.plugin :activerecord           # <=ここは:activerecordに変更
Shrine.plugin :cached_attachment_data # キャッシュを保存するメソッドを提供する
Shrine.plugin :restore_cached_data    # re-extract metadata when attaching a cached file
