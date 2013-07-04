class MetarGrabber
  module MetarGrabber::Filepath
    def self.surface_filename(input_time)
      input_time.utc
      date_part = input_time.gmtime.strftime('%Y%m%d')
      "#{date_part}_sao.gem"
    end

  end
end