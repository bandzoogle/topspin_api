require 'spec_helper'

describe TopspinApi::Store do
  before(:each) do
    @store = TopspinApi::Store.new "me@example.com", "123"
  end

  describe "page" do
    before(:each) do
      @store.stub(:fetch_json).and_return(fetch_json("page"))
      @offers = @store.offers(3752)
    end

    it { @offers.count.should == 1 }
    it { @offers.first["price"].should == "$100.00" }
    it { @offers.first["name"].should == "MY OFFER" }
  end

  describe "detail" do
    before(:each) do
      @store.stub(:fetch_json).and_return(fetch_json("detail"))
      @offer = @store.detail(59484)
    end

    it { @offer["price"].should == "$100.00" }
    it { @offer["name"].should == "MY OFFER" }
    it { @offer["description"].should == "an offer i am offering" }
    it { @offer["large_image_url"].should == "http://app.topspin.net/images/avatar_default.jpg" }
  end
end
