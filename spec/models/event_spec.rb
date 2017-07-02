require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
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
  end

  describe 'method' do
    context '.upcoming ' do
      it 'return [] if no have upcoming events ' do
        event1 = FactoryGirl.create(:event)
        event1.update_attributes(starts_at: Time.current - 10.days)
        event1.update_attributes(ends_at: Time.current - 1.day)
        expect(Event.upcoming).to eq([])
      end

      it 'return upcoming events ' do
        event1 = FactoryGirl.create(:event)
        event1.update_attributes(starts_at: Time.current + 1.day)
        event1.update_attributes(ends_at: Time.current + 10.days)
        expect(Event.upcoming).to eq([event1])
      end
    end

    context '.search ' do
      it 'return [] if no have upcoming events ' do
        event1 = FactoryGirl.create(:event)
        event1.update_attributes(starts_at: Time.current - 10.days)
        event1.update_attributes(ends_at: Time.current - 1.day)
        expect(Event.search(event1.name)).to eq([])
      end

      it 'return upcoming events with name' do
        event1 = FactoryGirl.create(:event)
        event1.update_attributes(starts_at: Time.current + 1.day)
        event1.update_attributes(ends_at: Time.current + 10.days)
        expect(Event.search(event1.name)).to eq([event1])
      end
    end

    context '.published ' do
      it 'return [] if no have upcoming events ' do
        expect(Event.published).to eq([])
      end

      it 'return published events with name' do
        event1 = FactoryGirl.create(:event)
        event1.update_attributes(ends_at: Time.current + 10.days)
        event1.update_attributes(published_at: Time.current + 1.day)
        expect(Event.published).to eq([event1])
      end
    end
  end
end
