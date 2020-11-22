unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:ACCESS_KEY],
      aws_secret_access_key: Rails.application.credentials.aws[:SECRET_KEY],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'zrails-photo-sauna'
    config.cache_storage = :fog
  end
end