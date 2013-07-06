class MetarGrabber
  module MetarGrabber::Filepath
    def self.gem_filename(input_time,ext,hour=nil)
      input_time.utc
      date_part = input_time.gmtime.strftime('%Y%m%d')
      "#{date_part}#{hour}_#{ext}.gem"
    end

    def self.sat_filename(input_time,sat_type,start=15)
      input_time.utc
      date_part = input_time.gmtime.strftime('%Y%m%d')
      filenames = []
      filenames[0] = "#{sat_type}_#{date_part}_#{input_time.gmtime.strftime('%H')}#{start}"
      filenames[1] = "#{sat_type}_#{date_part}_#{input_time.gmtime.strftime('%H')}#{start+30}"
      filenames
    end

  end
end