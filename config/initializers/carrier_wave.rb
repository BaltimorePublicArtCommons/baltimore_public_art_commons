CarrierWave::configure do |config|
  if Rails.env.production?
    config.storage :fog

    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['aws_access_key'],
      aws_secret_access_key: ENV['aws_secret_access_key'],
      path_style: true
    }

    config.fog_directory = ENV['s3_bucket_name']

    # Force HTTP asset URLs instead of HTTPS
    config.asset_host = "http://#{config.fog_directory}.s3.amazonaws.com"
  else
    config.storage :file
  end
end
