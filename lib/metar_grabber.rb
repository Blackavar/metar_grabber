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
      (0..1).each do |count|
        minutes = start + (count * 30)
        padded = "%02d" % minutes
        filenames[count] = "#{sat_type}_#{date_part}_#{input_time.gmtime.strftime('%H')}#{padded}"
      end
      filenames
    end

  end
end