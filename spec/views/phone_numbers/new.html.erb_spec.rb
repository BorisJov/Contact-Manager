require 'rails_helper'

RSpec.describe "phone_numbers/new", type: :view do
  let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
  let(:phone_number) { PhoneNumber.new(:contact_id => alice.id, :contact_type => 'Person', :number => "MyString") }
  before(:each) do
    assign(:phone_number, phone_number)
  end

  it "renders new phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do

      assert_select "input[name=?]", "phone_number[number]"

      assert_select "input[name=?]", "phone_number[contact_id]"
    end
  end
  it "shows the contact's name in the title" do
    render
    assert_select("h1", text: "New phone number for #{phone_number.contact}")
  end
end
