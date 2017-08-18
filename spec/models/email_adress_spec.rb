require 'rails_helper'

RSpec.describe EmailAdress, type: :model do
  let(:alice) { Person.create(first_name: 'Alice', last_name: 'Black') }
  let(:email_adress) { EmailAdress.new(adress: 'smth@yahoo.com', person_id: alice.id) }

  it 'is valid' do
    expect(email_adress).to be_valid
  end
  it 'is invalid without an adress' do
    email_adress.adress = nil
    expect(email_adress).to_not be_valid
  end
  it 'must have a reference to a Person' do
    email_adress.person_id = nil
    expect(email_adress).not_to be_valid
  end
  it 'is associated with a person' do
    expect(email_adress).to respond_to(:person)
  end
end
