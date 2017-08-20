require 'rails_helper'

RSpec.describe "email_adresses/new", type: :view do
  let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
  let(:email_adress) { EmailAdress.new(:person_id => alice.id, :adress => "MyString") }
  before(:each) do
    assign(:email_adress, email_adress)
  end

  it "renders new email_adress form" do
    render

    assert_select "form[action=?][method=?]", email_adresses_path, "post" do

      assert_select "input[name=?]", "email_adress[adress]"

      assert_select "input[name=?]", "email_adress[person_id]"
    end
  end
  it "shows the contact's name in the title" do
    render
    assert_select("h1", text: "New email address for #{email_adress.person}")
  end
end
