require 'spec_helper'

describe TopspinApi::Artist do
  before(:each) do
    @artist = TopspinApi::Artist.new "me@example.com", "123"
  end

  describe "list" do
    before(:each) do
      hash = fetch_json("artists")
      @artist.stub(:fetch_json).and_return(hash)
      @artists = @artist.list
    end

    it { @artists.count.should == 2 }
    it { @artists.first[:id].should == 3752 }
    it { @artists.first[:name].should == "David Dufresne TEST" }
  end

end
