require 'spec_helper'

describe MetarGrabber::Filepath do
  describe '.gem_filename when UTC is same day' do
    test_edt = MetarGrabber::Filepath.gem_filename(Time.new(2007,11,1,12, 5,0, "-05:00"), 'sao')
    test_edt.should == '20071101_sao.gem'
  end

  describe '.gem_filename when UTC is next day' do
    test_utc = MetarGrabber::Filepath.gem_filename(Time.new(2007,11,1,20, 5,0, "-05:00"), 'sao')
    test_utc.should == '20071102_sao.gem'
  end

end