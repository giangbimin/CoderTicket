require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  let(:valid_attributes) {
    skip('Add a hash of attributes valid for your model')
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  let(:valid_session) { {} }

  let(:login_session) { { user_id: User.create!(name: 'asdasd', email:'asdasd@asdas.com', password: '12345678').id } }

  context 'GET index' do
    it 'assigns @events [] when have no record' do
      get :index
      expect(assigns(:events)).to eq([])
    end

    it 'should show upcoming events' do
      event1 = FactoryGirl.create(:event)
      event1.update_attributes(starts_at: Time.current + 1.day)
      event2 = FactoryGirl.create(:event)
      event2.update_attributes(starts_at: Time.current - 1.day)

      get :index
      expect(assigns(:events)).to eq [event1]
    end

    it 'should show search with name' do
      event1 = FactoryGirl.create(:event)
      event1.update_attributes(starts_at: Time.current + 1.day)
      event2 = FactoryGirl.create(:event)
      event2.update_attributes(starts_at: Time.current + 1.day)
      event3 = FactoryGirl.create(:event)
      event3.update_attributes(starts_at: Time.current + 1.day)

      get :index, params: { search: event1.name }
      expect(assigns(:events)).to eq [event1]
    end
  end

  context 'GET show/:id' do
    it 'should have event' do
      event1 = FactoryGirl.create(:event)
      get :show, id: event1.id
      expect(assigns(:event)).to eq(event1)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: login_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Event' do
        expect {
          post :create, params: {event: valid_attributes}, session: login_session
        }.to change(Event, :count).by(1)
      end

      it 'redirects to the created event' do
        post :create, params: {event: valid_attributes}, session: login_session
        expect(response).to redirect_to(Event.last)
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the new template)' do
        post :create, params: {event: invalid_attributes}, session: login_session
        expect(response).to be_success
      end
    end
  end
end
