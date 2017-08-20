require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe EmailAdressesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # EmailAdress. As you add validations to EmailAdress, be sure to
  # adjust the attributes here as well.
  let(:alice) { Person.create(first_name: 'Alice', last_name: 'Smith') }
  let(:valid_attributes) do
    { adress: 'smth@yahoo.com', person_id: alice.id }
  end

  let(:invalid_attributes) do
    { adress: nil, person_id: nil}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmailAdressesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      email_adress = EmailAdress.create! valid_attributes
      get :edit, params: { id: email_adress.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new EmailAdress' do
        expect do
          post :create, params: { email_adress: valid_attributes }, session: valid_session
        end.to change(EmailAdress, :count).by(1)
      end

      it 'redirects to new owner' do
        post :create, params: { email_adress: valid_attributes }, session: valid_session
        expect(response).to redirect_to(EmailAdress.last.person)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { email_adress: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { adress: 'smth1@yahoo.com', person_id: alice.id }
      end

      it 'updates the requested email_adress' do
        email_adress = EmailAdress.create! valid_attributes
        put :update, params: { id: email_adress.to_param, email_adress: new_attributes }, session: valid_session
        email_adress.reload
        expect(email_adress.adress).to eq('smth1@yahoo.com')
        expect(email_adress.person_id).to eq(alice.id)
      end

      it 'redirects to owner' do
        email_adress = EmailAdress.create! valid_attributes
        put :update, params: { id: email_adress.to_param, email_adress: valid_attributes }, session: valid_session
        expect(response).to redirect_to(email_adress.person)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        email_adress = EmailAdress.create! valid_attributes
        put :update, params: { id: email_adress.to_param, email_adress: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested email_adress' do
      email_adress = EmailAdress.create! valid_attributes
      expect do
        delete :destroy, params: { id: email_adress.to_param }, session: valid_session
      end.to change(EmailAdress, :count).by(-1)
    end

    it 'redirects to former owner' do
      email_adress = EmailAdress.create! valid_attributes
      delete :destroy, params: { id: email_adress.to_param }, session: valid_session
      expect(response).to redirect_to(email_adress.person)
    end
  end
end
