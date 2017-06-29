require 'rails_helper'

describe 'events/index.html.erb', type: :view do
  it 'displays event details correctly' do
    event = FactoryGirl.create(:event)
    assign(:events, Event.all)

    render

    expect(rendered).to have_css('.card-title', text: event.name)
  end
end
