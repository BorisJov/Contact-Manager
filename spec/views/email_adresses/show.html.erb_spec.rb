require 'rails_helper'

RSpec.describe "email_adresses/show", type: :view do
  let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }

  before(:each) do
    @email_adress = assign(:email_adress, EmailAdress.create!(
      :adress => "Adress",
      :person_id => alice.id
    ))
  end

  it "renders attributes in <p>" do
    render
    str = alice.id.to_s
    alice_id_regexp = Regexp.new str
    expect(rendered).to match(/Adress/)
    expect(rendered).to match(alice_id_regexp)
  end
end
