require 'spec_helper'

describe "offers/index" do
  before(:each) do
    assign(:offers, [
      stub_model(Offer,
        :uid => "Uid",
        :pub0 => "Pub0",
        :page => 1,
        :locale => "Locale"
      ),
      stub_model(Offer,
        :uid => "Uid",
        :pub0 => "Pub0",
        :page => 1,
        :locale => "Locale"
      )
    ])
  end

  it "renders a list of offers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Pub0".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Locale".to_s, :count => 2
  end
end
