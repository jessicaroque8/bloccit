require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  describe "attributes" do

      it "responds to title" do
         expect(question).to respond_to(:title)
      end

      it "responds to body" do
         expect(question).to respond_to(:body)
      end

      it "responds to resolved" do
         expect(question).to respond_to(:resolved)
      end

   end

   describe "default value for resolved" do

      it "sets the default value for resolved to false" do
         expect(question.resolved).to eq(false)
      end

   end

end
