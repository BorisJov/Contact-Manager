require 'rails_helper'

RSpec.describe "email_adresses/index", type: :view do
  let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }

  before(:each) do
    assign(:email_adresses, [
      EmailAdress.create!(
        :adress => "Adress",
        :person_id => alice.id
      ),
      EmailAdress.create!(
        :adress => "Adress",
        :person_id => alice.id
      )
    ])
  end

  it "renders a list of email_adresses" do
    render
    assert_select "tr>td", :text => "Adress".to_s, :count => 2
    assert_select "tr>td", :text => alice.id.to_s, :count => 2
  end
end
