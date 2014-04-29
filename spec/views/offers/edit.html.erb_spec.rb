require 'spec_helper'

describe "offers/edit" do
  before(:each) do
    @offer = assign(:offer, stub_model(Offer,
      :uid => "MyString",
      :pub0 => "MyString",
      :page => 1,
      :locale => "MyString"
    ))
  end

  it "renders the edit offer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", offer_path(@offer), "post" do
      assert_select "input#offer_uid[name=?]", "offer[uid]"
      assert_select "input#offer_pub0[name=?]", "offer[pub0]"
      assert_select "input#offer_page[name=?]", "offer[page]"
      assert_select "input#offer_locale[name=?]", "offer[locale]"
    end
  end
end
