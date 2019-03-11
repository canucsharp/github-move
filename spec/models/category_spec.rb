require 'rails_helper'

RSpec.describe Category, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject { Category.new }

  it "is valid with valid attributes" do
    subject.title = "Anything"
    subject.item_id = 1
    subject.created_at = DateTime.now
    subject.updated_at = DateTime.now
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a item id" do
    subject.title = "Anything"
    expect(subject).to_not be_valid
  end

  it "is not valid without a created at date" do
    subject.title = "Anything"
    subject.item_id = 1
    expect(subject).to_not be_valid
  end

  it "is not valid without a updated at date" do
    subject.title = "Anything"
    subject.item_id = 1
    subject.created_at = DateTime.now
    expect(subject).to_not be_valid
  end
end
