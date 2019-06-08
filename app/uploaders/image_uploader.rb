require "image_processing/mini_magick"
require 'shrine/storage/s3'
class ImageUploader < Shrine
  plugin :processing # allows hooking into promoting
  plugin :versions   # enable Shrine to handle a hash of files
  #plugin :delete_raw # delete processed files after uploading
  plugin :determine_mime_type
  s3_options = {
    access_key_id:     ENV['S3_ACCESS_KEY_ID'],
    secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region:            ENV['S3_REGION'],
    bucket:            ENV['S3_BUCKET'],
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)}
  # @storages = {
  #   cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/image/cache"), # キャッシュファイル置き場を指定
  #   store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/image"),       # 画像保存先を指定
  # }

  process(:store) do |io, context|
    versions = { original: io } # retain original

    io.download do |original|
      pipeline = ImageProcessing::MiniMagick.source(original)

      versions[:large]  = pipeline.resize_to_limit!(600, 600)
    end

    versions # return the hash of processed files
  end

end