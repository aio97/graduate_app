# # require "carrierwave/storage/abstract"
# # require "carrierwave/storage/file"
# # require "carrierwave/storage/fog"
# # require "fog/aws"

# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider:              "AWS",                        # required
#     aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],                        # required unless using use_iam_profile
#     aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],                        # required unless using use_iam_profile
#     # use_iam_profile:       true,                         # optional, defaults to false
#     region:                "ap-southeast-2"                  # optional, defaults to 'us-east-1'
#     # host:                  's3.example.com',             # optional, defaults to nil
#     # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
#   }
#   config.fog_directory  = "watashi-no-shiori"                                      # required
#   config.fog_public     = false                                                 # optional, defaults to true
#   config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
#   # Use this if you have AWS S3 ACLs disabled.
#   # config.fog_attributes = { 'x-amz-acl' => 'bucket-owner-full-control' }
#   # Use this if you have Google Cloud Storage uniform bucket-level access enabled.
#   # config.fog_attributes = { uniform: true }
#   # For an application which utilizes multiple servers but does not need caches persisted across requests,
#   # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
#   # config.cache_storage = :file
# end
