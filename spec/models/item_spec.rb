require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { Item.new }

  it "is valid with valid attributes" do
    subject.category_id = 1
    subject.title = "Anything"
    subject.priority = "Anything"
    subject.completed = true
    subject.completed_on = DateTime.now
    subject.created_at = DateTime.now
    subject.updated_at = DateTime.now
    subject.category = Category.new(title:"Work", item_id:1, created_at:DateTime.now, updated_at:DateTime.now)
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    expect(subject).to_not be_valid
  end

  it "is not valid without a category id" do
    subject.title = "Anything"
    expect(subject).to_not be_valid
  end

  it "is not valid without a created at date" do
    subject.title = "Anything"
    subject.category_id = 1
    expect(subject).to_not be_valid
  end

  it "is not valid without a updated at date" do
    subject.title = "Anything"
    subject.category_id = 1
    subject.created_at = DateTime.now
    expect(subject).to_not be_valid
  end

  it "is not valid without a completed value" do
    subject.title = "Anything"
    subject.category_id = 1
    subject.created_at = DateTime.now
    subject.updated_at = DateTime.now
    expect(subject).to_not be_valid
  end

  it "is not valid without a completed date" do
    subject.title = "Anything"
    subject.category_id = 1
    subject.created_at = DateTime.now
    subject.updated_at = DateTime.now
    subject.completed = 1
    expect(subject).to_not be_valid
  end

  it "is not valid without a priority" do
    subject.title = "Anything"
    subject.category_id = 1
    subject.created_at = DateTime.now
    subject.updated_at = DateTime.now
    subject.completed = 1
    subject.completed_on = DateTime.now
    expect(subject).to_not be_valid
  end

  it "is not valid without a category" do
    subject.title = "Anything"
    subject.category_id = 1
    subject.created_at = DateTime.now
    subject.updated_at = DateTime.now
    subject.completed = 1
    subject.completed_on = DateTime.now
    subject.priority = "Anything"
    expect(subject).to_not be_valid
  end
end
