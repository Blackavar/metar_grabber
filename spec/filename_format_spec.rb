require 'spec_helper'

describe MetarGrabber::Filepath do
  describe '.surface_filename when UTC is same day' do
    test_edt = MetarGrabber::Filepath.surface_filename(Time.new(2007,11,1,12, 5,0, "-05:00"))
    test_edt.should == '20071101_sao.gem'
  end

  describe '.surface_filename when UTC is next day' do
    test_utc = MetarGrabber::Filepath.surface_filename(Time.new(2007,11,1,20, 5,0, "-05:00"))
    test_utc.should == '20071102_sao.gem'
  end

end