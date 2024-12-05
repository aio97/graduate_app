require "carrierwave/storage/abstract"
require "carrierwave/storage/file"
require "carrierwave/storage/fog"

CarrierWave.configure do |config|
  # config.storage :fog
  # # config.fog_provider = "fog/aws"
  # config.fog_directory  = "watashi-no-shiori"
  # config.fog_public = false
  # config.fog_credentials = {
  #     provider: "AWS",
  #     aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  #     aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
  #     region: "ap-southeast-2"
  #   #   path_style: true
  # }
  if Rails.env.production? || Rails.env.development? # 開発中もs3使う
    config.storage :fog
    # config.fog_provider = 'fog/aws'
    config.fog_directory  = "watashi-no-shiori"
    config.asset_host = "https://watashi-no-shiori.s3.amazonaws.com"
    # NOTE: AWS側の設定を変えなくても、この１行の設定でアップロードできた
    config.fog_public = false # ←コレ
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: "ap-southeast-2",
      # path_style: true
    }
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end
