require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => "Number",
      :contact_id => alice.id,
      contact_type: 'Person'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)

    #j**** mu sunce za ovo, zar nema lakse?
    str = alice.id.to_s
    alice_id_regexp = Regexp.new str
    expect(rendered).to match(alice_id_regexp)
  end
end
