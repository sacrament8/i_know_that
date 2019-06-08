require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  if Rails.env.production?
    config.asset_host = "https://" + ENV['S3_BUCKET'] + ".s3-ap-northeast-1.amazonaws.com"
    config.storage :fog
    config.cache_storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = ENV['S3_BUCKET']
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: ENV['S3_REGION'],
      path_style: true
    }
    config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end

# CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
# CarrierWave.configure do |config|
#   require 'carrierwave/storage/abstract'
#   require 'carrierwave/storage/file'
#   require 'carrierwave/storage/fog'

#   config.storage :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#       provider:              'AWS',
#       aws_access_key_id:     ENV["S3_ACCESS_KEY_ID"],
#       aws_secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
#       region:                ENV['S3_REGION'],
#       path_style:            true,
#   }

#   config.fog_public     = true
#   config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

#   case Rails.env
#     when 'production'
#       config.fog_directory = ENV['S3_BUCKET']
#       config.asset_host = "https://s3-ap-northeast-1.amazonaws.com/" + ENV['S3_BUCKET']
#     when 'development'
#       config.storage :file
#       config.enable_processing = false if Rails.env.test?
#   end
# end