require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  context 'GET new' do
    it 'should assigns @event' do
      event1 = FactoryGirl.create(:event)
      get :new, event_id: event1.id
      expect(assigns(:event)).to eq(event1)
    end
  end
end
