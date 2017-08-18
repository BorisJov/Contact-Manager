require 'rails_helper'

RSpec.describe "email_adresses/new", type: :view do
  before(:each) do
    assign(:email_adress, EmailAdress.new(
      :adress => "MyString",
      :person_id => 1
    ))
  end

  it "renders new email_adress form" do
    render

    assert_select "form[action=?][method=?]", email_adresses_path, "post" do

      assert_select "input[name=?]", "email_adress[adress]"

      assert_select "input[name=?]", "email_adress[person_id]"
    end
  end
end
