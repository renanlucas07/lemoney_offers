require 'rails_helper'

RSpec.describe Offer, type: :model do

  subject {
    described_class.new(advertiser_name: 'A Name',
                        url: 'https://guides.rubyonrails.org/',
                        description: 'A description',
                        starts_at: DateTime.now,
                        ends_at: DateTime.now + 1.day,
                        premium: true,
                        state: State::ENABLED)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an advertiser_name" do
    subject.advertiser_name = nil

    expect(subject).to_not be_valid
  end

  it "is not valid without an uniq advertiser_name" do
    subject.save

    offer_with_same_advertiser_name = subject.dup
    expect(offer_with_same_advertiser_name).to_not be_valid
  end
  it "is not valid without an url" do
    subject.url = nil

    expect(subject).to_not be_valid
  end
  it "is not valid without a valid URI format" do
    subject.url = 'invalid URI'

    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description = nil

    expect(subject).to_not be_valid
  end
  it "is not valid with a description with more than 500 chars" do
    # This text has 501 characters
    subject.description = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus'

    expect(subject).to_not be_valid
  end
  it "is not valid without a starts_at" do
    subject.starts_at = nil

    expect(subject).to_not be_valid
  end
end
