require 'spec_helper'

describe TopspinStore::Store do
  before(:each) do
    @store = TopspinStore::Store.new 3752
  end

  describe "page" do
    before(:each) do
      @store.client.stub!(:page).and_return(fetch_json("page"))
      @offers = @store.offers
    end

    it { @offers.should have(1).offer }
    it { @offers.first["price"].should == "$100.00" }
    it { @offers.first["name"].should == "MY OFFER" }
    it { @offers.total_pages.should == 1 }
    it { @offers.current_page.should == 1 }
    it { @offers.total_entries.should == 1 }
    it { @offers.per_page.should == 25 }

  end

  describe "detail" do
    before(:each) do
      @store.client.stub!(:detail).and_return(fetch_json("detail"))
      @offer = @store.detail(59484)
    end

    it { @offer["price"].should == "$100.00" }
    it { @offer["name"].should == "MY OFFER" }
    it { @offer["description"].should == "an offer i am offering" }
    it { @offer["large_image_url"].should == "http://app.topspin.net/images/avatar_default.jpg" }

  end

end