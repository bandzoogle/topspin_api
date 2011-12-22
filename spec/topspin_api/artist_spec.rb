require 'spec_helper'

describe TopspinApi::Artist do
  before(:each) do
    @artist = TopspinApi::Artist.new
  end

  describe "authenticate" do
    it { @artist.authenticate("me@example.com", "123").should_not be_nil }
  end

  describe "list" do
    before(:each) do
      hash = fetch_json("artists")
      @artist.stub!(:fetch_json).and_return(hash)
      @artists = @artist.list
    end

    it { @artists.should have(2).stores }
    it { @artists.first[:id].should == 3752 }
    it { @artists.first[:name].should == "David Dufresne TEST" }
    it { @artists.total_pages.should == 1 }
    it { @artists.current_page.should == 1 }
    it { @artists.total_entries.should == 2 }
    it { @artists.per_page.should == 25 }

  end

end