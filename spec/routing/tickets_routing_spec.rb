require 'rails_helper'

describe 'ticket Routes', type: :routing do
  it 'routes events/1/tickets to tickets#index' do
    expect(get: 'events/1/tickets').to route_to(
      controller: 'tickets',
      action: 'index',
      event_id: '1'
    )
  end

  it 'routes events/1/tickets/1 to tickets#show' do
    expect(get: 'events/1/tickets/1').to route_to(
      controller: 'tickets',
      action: 'show',
      id: '1',
      event_id: '1'
    )
  end

  it 'routes events/1/tickets/new to tickets#new' do
    expect(get: 'events/1/tickets/new').to route_to(
      controller: 'tickets',
      action: 'new',
      event_id: '1'
    )
  end

  it 'routes events/1/tickets to tickets#create' do
    expect(post: 'events/1/tickets').to route_to(
      controller: 'tickets',
      action: 'create',
      event_id: '1'
    )
  end

  it 'routes events/1/tickets/1/edit to tickets#edit' do
    expect(get: 'events/1/tickets/1/edit').to route_to(
      controller: 'tickets',
      action: 'edit',
      id: '1',
      event_id: '1'
    )
  end

  it 'routes events/1/tickets/1 to tickets#update' do
    expect(put: 'events/1/tickets/1').to route_to(
      controller: 'tickets',
      action: 'update',
      id: '1',
      event_id: '1'
    )
  end

  it 'routes events/1/tickets/1 to tickets#destroy' do
    expect(delete: 'events/1/tickets/1').to route_to(
      controller: 'tickets',
      action: 'destroy',
      id: '1',
      event_id: '1'
    )
  end
end
