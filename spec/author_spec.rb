require_relative '../game/author'
require_relative '../item'
require 'rspec'
require 'rspec/mocks'

RSpec.describe Author do
  let(:item) { double('item') }
  subject { Author.new('John', 'Doe') }
  it "adds an item to the author's items" do
    initial_items = subject.items.dup

    allow(item).to receive(:author=)
    allow(subject).to receive(:add_item).and_call_original

    subject.add_item(item)

    expect(subject.items).to include(item)
    expect(subject.items).to eq(initial_items + [item])
  end
  it 'has first name and last name' do
    expect(subject.first_name).to eq('John')
    expect(subject.last_name).to eq('Doe')
  end
  it 'initially has an empty item array' do
    expect(subject.items).to be_empty
  end
  it 'does not add the same item to the items array' do
    allow(item).to receive(:author=)
    subject.add_item(item)
    subject.add_item(item)
    expect(subject.items).to contain_exactly(item)
  end
  it 'can convert to a hash ' do
    hash = subject.to_hash
    expect(hash).to include(id: subject.id, first_name: 'John', last_name: 'Doe')
  end
end
