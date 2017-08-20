require 'rails_helper'

describe 'the person view', type: :feature do
  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  describe 'phone numbers' do
    before(:each) do
      person.phone_numbers.create(number: '555-1234', contact_type: 'Person')
      person.phone_numbers.create(number: '555-5678', contact_type: 'Person')
      visit person_path(person)
    end

    it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

    it 'has a link to add a new phone number' do
      expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: person.id, contact_type: 'Person'))
    end
    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-333')
      page.click_button('Create Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-333')
    end

    it 'has links to edit phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end
    it 'edits a phone number' do
      phone = person.phone_numbers.first
      old_number = phone.number

      first(:link, 'edit').click
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('555-9191')
      expect(page).to_not have_content(old_number)
    end

    it 'has links to destroy phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_link('delete', href: phone_number_path(phone.id))
      end
    end
    it 'destroys phone numbers' do
      phone = person.phone_numbers.first
      first(:link, 'delete').click
      expect(page).to_not have_content(phone)
    end
  end

  describe 'email adresses' do
    before(:each) do
      person.email_adresses.create(adress: 'smth@yahoo.com')
      person.email_adresses.create( adress: 'smth@gmail.com')
      visit(person_path(person))
    end

    it 'shows each adress' do
      person.email_adresses.each do |adr|
        expect(page).to have_content(adr.adress)
      end
    end
    it 'has a link to add a new email adress' do
      expect(page).to have_link('Add email adress', href: new_email_adress_path(person_id: person.id))
    end
    it 'adds a new email adress' do
      page.click_link('Add email adress')
      page.fill_in('Adress', with: 'ghak@gmail.com')
      page.click_button('Create Email adress')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('ghak@gmail.com')
    end

    it 'has links to edit email adresses' do
      person.phone_numbers.each do |adr|
        expect(page).to have_link('edit', href: edit_email_adress_path(adr))
      end
    end
    it 'edits a phone number' do
      adr = person.email_adresses.first
      old_adr = adr.adress

      first(:link, 'edit').click
      page.fill_in('Adress', with: 'ghik@gmail.com')
      page.click_button('Update Email adress')
      expect(current_path).to eq(person_path(person))
      expect(page).to have_content('ghik@gmail.com')
      expect(page).to_not have_content(old_adr)
    end

    it 'has links to destroy email adresses' do
      person.email_adresses.each do |adr|
        expect(page).to have_link('delete', href: email_adress_path(adr))
      end
    end
    it 'destroys email adresses' do
      adr = person.email_adresses.first
      first(:link, 'delete').click
      expect(page).to_not have_content(adr)
    end

  end
end

