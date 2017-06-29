require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  # context 'GET index' do
  #   it 'assigns @events [] when have no record' do
  #     get :index
  #     expect(assigns(:events)).to eq([])
  #   end

  #   it 'should assigns @events' do
  #     event = FactoryGirl.create(:event)
  #     get :index
  #     expect(assigns(:events)).to eq([event])
  #   end
  # end

  context 'GET show/:id' do
    it 'should have event' do
      event1 = FactoryGirl.create(:event)
      get :show, id: event1.id
      expect(assigns(:event)).to eq(event1)
    end
  end

  context 'GET index' do
    it 'should show upcoming events' do
      event1 = FactoryGirl.create(:event)
      event1.update_attributes(starts_at: Time.current + 1.day)
      event2 = FactoryGirl.create(:event)
      event2.update_attributes(starts_at: Time.current - 1.day)

      get :index
      expect(assigns(:events)).to eq [event1]
    end
  end
end
