require 'rails_helper'

describe 'tickets/new.html.erb', type: :view do
  it 'displays event details correctly' do
    event = FactoryGirl.create(:event)
    assign(:event, event)

    render

    expect(rendered).to have_css('h3', text: event.name)
    expect(rendered).to have_css('.time-details', text: event.starts_at.strftime('%A, %d %b %Y %l:%M %p'))
  end
end
