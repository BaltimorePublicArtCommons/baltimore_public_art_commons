namespace :erd do
  task generate: :erd_with_timestamp

  task :erd_with_timestamp do
    unless ENV['title']
      git_sha = %x{git rev-parse HEAD}[0...8]
      timezone = ActiveSupport::TimeZone.new('Eastern Time (US & Canada)')
      time = Time.now.in_time_zone(timezone)

      date = time.strftime("%Y-%m-%d")
      hour = time.strftime("%l %p").strip
      timestamp = "#{date} #{hour} Baltimore"

      title = "Baltimore Public Art Commons domain model—#{timestamp} (rev: #{git_sha})"
      RailsERD.options[:title] = title
    end
  end
end
