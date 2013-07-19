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
    it 'when UTC is same day and time is not specified' do
      test_edt = MetarGrabber::Filepath.sat_filename(Time.new(2007,11,1,12, 5,0, "-05:00"), 'IR')
      test_edt.should == ['IR_20071101_1715','IR_20071101_1745']
    end

    it 'when UTC is next day and time is not specified' do
      test_utc = MetarGrabber::Filepath.sat_filename(Time.new(2007,11,1,20, 5,0, "-05:00"), 'IR')
      test_utc.should == ['IR_20071102_0115','IR_20071102_0145']
    end

    it 'when UTC is same day and time is 00' do
      test_edt = MetarGrabber::Filepath.sat_filename(Time.new(2007,11,1,12, 5,0, "-05:00"), 'VIS', 0)
      test_edt.should == ['VIS_20071101_1700','VIS_20071101_1730']
    end

    it 'when UTC is next day and time is 00' do
      test_utc = MetarGrabber::Filepath.sat_filename(Time.new(2007,11,1,20, 5,0, "-05:00"), 'VIS', 0)
      test_utc.should == ['VIS_20071102_0100','VIS_20071102_0130']
    end
  end

  describe '.radar_filename' do
    it "when UTC is same day" do
      test_edt = MetarGrabber::Filepath.radar_filename(Time.new(2007,11,1,12, 5,0, "-05:00"), 'FOP1')
      test_edt.should == 'FOP1_20071101_1705'
    end

    it 'when UTC is next day' do
      test_utc = MetarGrabber::Filepath.radar_filename(Time.new(2007,11,1,20, 5,0, "-05:00"), 'FOP1')
      test_utc.should == 'FOP1_20071102_0105'
    end
  end
end