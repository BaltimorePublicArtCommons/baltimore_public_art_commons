namespace :erd do
  task generate: :erd_with_timestamp

  task :erd_with_timestamp do
    unless ENV['title']
      git_sha = %x{git rev-parse HEAD}[0...8]
      timestamp = Time.now.utc.strftime("%Y-%m-%d")

      title = "Baltimore Public Art Commons domain model—#{timestamp} (rev: #{git_sha})"
      RailsERD.options[:title] = title
    end
  end
end
