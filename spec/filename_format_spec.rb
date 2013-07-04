require 'spec_helper'

describe MetarGrabber::Filepath do
  before :each do
    @test_time = Time.new(2002, 10, 31, 2, 2, 2, "+02:00")
  end

  describe '.surface_filename' do
    test_path = MetarGrabber::Filepath.surface_filename(@test_time)
  end

end