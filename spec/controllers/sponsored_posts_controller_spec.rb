require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

   let(:mytopic){Topic.create!(name: "My Topic Title", description: "My Topic Description")}
   let(:mysppost){SponsoredPost.create!(topic_id: mytopic.id, title: "My Sponsored Post Title", body: "My Sponsored Post Body")}
  #
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show, params: {topic_id: mytopic.id, id: mysppost.id}
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "renders the show view" do
  #     get :show, params: {topic_id: mytopic.id, id: mysppost.id}
  #     expect(response).to render_template :show
  #   end
  #
  #   it "assigns mysppost to sponsoredpost" do
  #      get :show, params: {topic_id: mytopic.id, id: mysppost.id}
  #      expect(assigns(:sponsored_post)).to eq(mysppost)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new, params: {topic_id: mytopic.id}
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "renders the new view" do
  #     get :new, params: {topic_id: mytopic.id}
  #     expect(response).to render_template :new
  #   end
  #
  #   it "instantiates sponsored_post" do
  #     get :new, params: {topic_id: mytopic.id}
  #     expect(assigns(:sponsored_post)).not_to be_nil
  #   end
  # end

  # describe "POST create" do
  #    it "increases the number of sponsored posts by 1" do
  #       expect{post :create, params: {topic_id: mytopic.id, sponsored_post: {title: "My Sponsored Post Title", body: "My Sponsored Post Body"}}}.to change(SponsoredPost,:count).by(1)
  #    end
  #
  #    it "assigns the new sponsored post to @sponsored_post" do
  #       post :create, params: { topic_id: mytopic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
  #       expect(assigns(:sponsored_post)).to eq SponsoredPost.last
  #    end
  #
  #    it "redirects to the new sponsored post" do
  #       post :create, params: { topic_id: mytopic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
  #       expect(response).to redirect_to [mytopic, SponsoredPost.last]
  #    end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit, params: {topic_id: mytopic.id, id: mysppost.id}
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "renders the edit view" do
  #     get :edit, params: {topic_id: mytopic.id, id: mysppost.id}
  #     expect(response).to render_template :edit
  #   end
  #
  #   it "assigns mysppost to sponsored_post" do
  #     get :edit, params: {topic_id: mytopic.id, id: mysppost.id}
  #     sppost_instance = assigns(:sponsored_post)
  #
  #     expect(sppost_instance.id).to eq(mysppost.id)
  #     expect(sppost_instance.title).to eq(mysppost.title)
  #     expect(sppost_instance.body).to eq(mysppost.body)
  #   end
  # end

  describe "PUT update" do
     it "updates sponsored post with expected attributes" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph

        put :update, params: { topic_id: mytopic.id, id: mysppost.id, sponsored_post: {title: new_title, body: new_body } }

        updated_post = assigns(:sponsored_post)
        expect(updated_post.id).to eq mysppost.id
        expect(updated_post.title).to eq new_title
        expect(updated_post.body).to eq new_body
     end

     it "redirects to the updated sponsored post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

       put :update, params: { topic_id: mytopic.id, id: mysppost.id, sponsored_post: {title: new_title, body: new_body } }
       expect(response).to redirect_to [mytopic, mysppost]
     end
  end

  describe "DELETE destroy" do
     it "deletes the post" do
     delete :destroy, params: { topic_id: mytopic.id, id: mysppost.id }
     count = SponsoredPost.where({id: mysppost.id}).size
     expect(count).to eq 0
     end

     it "redirects to topic show" do
     delete :destroy, params: { topic_id: mytopic.id, id: mysppost.id }
     expect(response).to redirect_to mytopic
     end
  end

end
