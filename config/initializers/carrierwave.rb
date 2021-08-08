CarrierWave.configure do |config|
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'


  case Rails.env
    when 'production'
      config.storage :fog
      config.fog_provider = 'fog/aws'
      config.fog_credentials = {
          provider:              'AWS',
          aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
          aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
          region:                'ap-northeast-1',
          path_style:            true,
      }
      config.fog_public     = true
      config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
      config.fog_directory = 'nowonmap-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/nowonmap-production'
    when 'development'
      config.storage :file
    when 'text'
      config.storage :file
  end
end
