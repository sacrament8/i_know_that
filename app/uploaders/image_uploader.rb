require "image_processing/mini_magick"
class ImageUploader < Shrine
  plugin :processing # allows hooking into promoting
  plugin :versions   # enable Shrine to handle a hash of files
  #plugin :delete_raw # delete processed files after uploading
  plugin :determine_mime_type
  
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