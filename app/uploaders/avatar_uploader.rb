class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_fill: [720, 720, 'Center']

  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # デフォルト画像の設定
  def default_url(*_args)
    'default_prof.png'
  end

  # 許可する画像の拡張子
  def extension_white_list
    %w[jpg jpeg gif png]
  end

  # ファイルサイズの制限
  def size_range
    0..5.megabytes
  end
end
