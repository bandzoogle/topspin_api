require 'spec_helper'

describe TopspinApi::Client do
  before(:each) do
    @client = TopspinApi::Client.new 3752
  end

  describe "page" do
    before(:each) do
      @client.stub!(:page).and_return(fetch_json("page"))
    end
    it { @client.page.should_not be_nil }

  end

  describe "detail" do
    before(:each) do
      @client.stub!(:detail).and_return(fetch_json("detail"))
    end
    it { @client.detail(:offer_id => 59484).should_not be_nil }

  end

end