require 'rails_helper'

RSpec.describe Task, type: :model do

  it "is valid with a title, content" do
    task = FactoryBot.build(:task)
    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task = FactoryBot.build(:task, title: nil)
    task.valid?
    expect(task.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a content" do
    task = FactoryBot.build(:task, content: nil)
    task.valid?
    expect(task.errors[:content]).to include("can't be blank")
  end
end