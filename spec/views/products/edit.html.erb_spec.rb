require 'spec_helper'

describe "products/edit.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :code => "MyString",
      :price => "9.99",
      :active => false
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_code", :name => "product[code]"
      assert_select "input#product_price", :name => "product[price]"
      assert_select "input#product_active", :name => "product[active]"
    end
  end
end
