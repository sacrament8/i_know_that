require "shrine"

if Rails.env.production?
  require 'shrine/storage/s3'
  s3_options = {
    access_key_id:     ENV['S3_ACCESS_KEY_ID'],
    secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
    region:            ENV['S3_REGION'],
    bucket:            ENV['S3_BUCKET'],
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)}
else
  require "shrine/storage/file_system"
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/image/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/image"),
  }
end
Shrine.plugin :logging
Shrine.plugin :determine_mime_type
Shrine.plugin :restore_cached_data
Shrine.plugin :activerecord           # <=ここは:activerecordに変更
Shrine.plugin :cached_attachment_data # キャッシュを保存するメソッドを提供する
Shrine.plugin :restore_cached_data    # re-extract metadata when attaching a cached file
if Rails.env.production?
  Shrine.plugin :presign_endpoint, presign_options: -> (request) {
    # Uppy will send the "filename" and "type" query parameters
    filename = request.params["filename"]
    type     = request.params["type"]

    {
      content_disposition:    ContentDisposition.inline(filename), # set download filename
      content_type:           type,                                # set content type
      content_length_range:   0..(10*1024*1024),                   # limit upload size to 10 MB
    }
  }
else
  Shrine.plugin :upload_endpoint
end

Shrine.plugin :derivation_endpoint,
  secret_key: "secret",
  download_errors: [defined?(Shrine::Storage::S3) ? Aws::S3::Errors::NotFound : Errno::ENOENT]




