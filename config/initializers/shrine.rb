require "shrine"
require "shrine/storage/file_system"
require 'shrine/storage/s3'
if Rails.env.production?
  s3_options = {
    access_key_id:     ENV['S3_ACCESS_KEY_ID'],
    secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region:            ENV['S3_REGION'],
    bucket:            ENV['S3_BUCKET']}

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)}
else
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/avatar/cache"), # キャッシュファイル置き場を指定
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/avatar"),       # 画像保存先を指定
  }
end



Shrine.plugin :activerecord           # <=ここは:activerecordに変更
Shrine.plugin :cached_attachment_data # キャッシュを保存するメソッドを提供する
Shrine.plugin :restore_cached_data    # re-extract metadata when attaching a cached file
