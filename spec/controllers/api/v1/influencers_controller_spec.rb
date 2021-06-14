require 'rails_helper'

describe Api::V1::InfluencersController do
  describe "GET #index" do

    before do
      tag = Tag.create(name: 'sports')
      platform = Platform.create(id: 1, name: 'facebook', base_url: 'https://www.facebook.com/')
      influencer = Influencer.create(handle: 'mattholland8', followers: 80_024, profile_pic_url: 'https://pbs.twimg.com/profile_images/1359778507224723457/QrykIUlp.jpg', platform_id: platform.id)
      InfluencerTag.create(influencer_id: influencer.id, tag_id: tag.id)
      get :index
    end

    it "returns http success" do
      p JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end

    # it "JSON body response contains expected recipe attributes" do
    #   json_response = JSON.parse(response.body)
    #   expect(hash_body.keys).to match_array([:id, :ingredients, :instructions])
    # end

  end
end
