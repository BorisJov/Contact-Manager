require 'rails_helper'

RSpec.describe "phone_numbers/edit", type: :view do
  let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }

  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      number: "MyString",
      contact_id: alice.id,
      contact_type: 'Person'
    ))
  end

  it "renders the edit phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do

      assert_select "input[name=?]", "phone_number[number]"

      assert_select "input[name=?]", "phone_number[contact_id]"
    end
  end
  it "shows the contact's name in the title" do
    render
    assert_select("h1", text: "New phone number for #{@phone_number.contact}")
  end
end
