require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:ACCESS_KEY],
      aws_secret_access_key: Rails.application.credentials.aws[:SECRET_KEY],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'check-user1-bucket'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/check-user1-bucket'
  end
end
