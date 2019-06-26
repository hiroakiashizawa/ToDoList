require 'rails_helper'

RSpec.describe Task, type: :model do

  before do
    @task = FactoryBot.build(:task)
    @task_no_title = FactoryBot.build(:task_no_title)
    @task_no_content = FactoryBot.build(:task_no_content)
  end

  describe 'validation' do

    it "is valid with a title, content" do
      expect(@task).to be_valid
    end

    it "is invalid without a title" do
      @task_no_title.valid?
      expect(@task_no_title.errors[:title]).to include("can't be blank")
    end

    it "is invalid without a content" do
      @task_no_content.valid?
      expect(@task_no_content.errors[:content]).to include("can't be blank")
    end
  end
end