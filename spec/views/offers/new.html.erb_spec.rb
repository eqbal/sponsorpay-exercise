require 'spec_helper'

describe "offers/new" do
  before(:each) do
    assign(:offer, stub_model(Offer,
      :uid => "MyString",
      :pub0 => "MyString",
      :page => 1,
      :locale => "MyString"
    ).as_new_record)
  end

  it "renders new offer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", offers_path, "post" do
      assert_select "input#offer_uid[name=?]", "offer[uid]"
      assert_select "input#offer_pub0[name=?]", "offer[pub0]"
      assert_select "input#offer_page[name=?]", "offer[page]"
      assert_select "input#offer_locale[name=?]", "offer[locale]"
    end
  end
end
