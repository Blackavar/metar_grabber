class MetarGrabber
  module MetarGrabber::Filepath
    def self.gem_filename(input_time,ext)
      input_time.utc
      date_part = input_time.gmtime.strftime('%Y%m%d')
      "#{date_part}_#{ext}.gem"
    end

  end
end