=begin
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => Rails.application.secrets.aws_access_key_id,     # required
    :aws_secret_access_key  => Rails.application.secrets.aws_secret_access_key, # required
    :region                 => 'us-east-1'                   # optional, defaults to 'us-east-1'
    #:host                   => 's3.example.com',             # optional, defaults to nil
    #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = Rails.application.secrets.cw_bucket                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {}  # optional, defaults to {}
end
=end