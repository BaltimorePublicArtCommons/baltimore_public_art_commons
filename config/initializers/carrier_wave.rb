CarrierWave::configure do |config|
  if Rails.env.production?
    config.storage :fog

    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['bpac_dev_aws_access_key'],
      aws_secret_access_key: ENV['bpac_dev_aws_secret_access_key'],
      path_style: true
    }

    config.fog_directory = ENV['bpac_aws_bucket']

    # Force HTTP asset URLs instead of HTTPS
    config.asset_host = "http://#{config.fog_directory}.s3.amazonaws.com"
  else
    config.storage :file
  end
end
