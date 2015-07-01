module RandomHash

  def self.generate
    Digest::SHA1.base64digest "#{DateTime.now}#{rand}"
  end

end
