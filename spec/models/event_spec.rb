require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'association' do
    it { should belong_to(:venue) }
    it { should belong_to(:category) }
    it { should have_many(:ticket_types) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:extended_html_description) }
    it { should validate_presence_of(:venue) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:starts_at) }
    it { should validate_uniqueness_of(:name) }
    # it { should validate_uniqueness_of(:name).scoped_to([:venue, :starts_at])}
  end

  describe 'method' do
    context ' method search with ' do
      it '.upcoming' do
        event1 = FactoryGirl.create(:event)
        event1.update_attributes(starts_at: Time.current + 1.day)
        event2 = FactoryGirl.create(:event)
        event2.update_attributes(starts_at: Time.current - 1.day)

        expect(Event.upcoming).to eq([event1])
      end
    end
  end
end
