require 'spec_helper'

describe MetarGrabber::Filepath do
  describe '.gem_filename' do
    it 'when UTC is same day' do
      test_edt = MetarGrabber::Filepath.gem_filename(Time.new(2007,11,1,12, 5,0, "-05:00"), 'sao')
      test_edt.should == '20071101_sao.gem'
    end

    it 'when UTC is next day' do
      test_utc = MetarGrabber::Filepath.gem_filename(Time.new(2007,11,1,20, 5,0, "-05:00"), 'sao')
      test_utc.should == '20071102_sao.gem'
    end

    it 'with hour - same day' do
      test_edt = MetarGrabber::Filepath.gem_filename(Time.new(2007,11,1,12, 5,0, "-05:00"), 'warn', 12)
      test_edt.should == '2007110112_warn.gem'
    end

    it 'with hour - next day' do
      test_edt = MetarGrabber::Filepath.gem_filename(Time.new(2007,11,1,20, 5,0, "-05:00"), 'warn', 12)
      test_edt.should == '2007110212_warn.gem'
    end
  end

  describe '.sat_filename' do
    # TYP_YYYYMMDD_HHmm - minutes are 30 min apart, on hour/half or 15/45
    it 'when UTC is same day and time is not ' do
      test_edt = MetarGrabber::Filepath.sat_filename(Time.new(2007,11,1,12, 5,0, "-05:00"), 'IR')
      test_edt.should == ['IR_20071101_1715','IR_20071101_1745']
    end
  end
end