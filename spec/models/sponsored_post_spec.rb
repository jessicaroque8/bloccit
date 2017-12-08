require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
   let(:topic){Topic.create!(name: "My topic", description: "My topic description")}
   let(:sppost){SponsoredPost.create!(topic: topic, title: "Title", body: "Body", price: 8)}

   it { is_expected.to belong_to(:topic) }
   
  describe "has attributes" do
     it "has attributes title, body, price" do
        expect(sppost).to have_attributes( title: "Title", body: "Body", price: 8 )
     end
  end

end
