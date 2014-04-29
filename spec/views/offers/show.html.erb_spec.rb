require 'spec_helper'

describe "offers/show" do
  before(:each) do
    @offer = assign(:offer, stub_model(Offer,
      :uid => "Uid",
      :pub0 => "Pub0",
      :page => 1,
      :locale => "Locale"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Uid/)
    rendered.should match(/Pub0/)
    rendered.should match(/1/)
    rendered.should match(/Locale/)
  end
end
