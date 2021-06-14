require 'rails_helper'

describe Api::V1::InfluencersController do
  describe "GET #index" do
    context 'with a single influencer' do

      before(:example) do
        tag = Tag.create(name: 'sports')
        platform = Platform.create(id: 1, name: 'facebook', base_url: 'https://www.facebook.com/')
        influencer = Influencer.create(handle: 'mattholland8', followers: 80_024, profile_pic_url: 'https://pbs.twimg.com/profile_images/1359778507224723457/QrykIUlp.jpg', platform_id: platform.id)
        InfluencerTag.create(influencer_id: influencer.id, tag_id: tag.id)

        get :index

        @json = JSON.parse(response.body)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "contains the correct influencer keys" do
        @json = @json[0]
        expect([@json["id"], @json["handle"], @json["platform"], @json["followers"], @json["profile_pic_url"], @json["tags"]]).to all(be_truthy)
      end

      it "contains the correct platform keys" do
        @json = @json[0]["platform"]
        expect([@json["id"], @json["name"], @json["base_url"]]).to all(be_truthy)
      end

      it "contains the correct tag keys" do
        @json = @json[0]["tags"][0]
        expect([@json["id"], @json["name"]]).to all(be_truthy)
      end

    end

    context 'with mutiple influencers' do

      before(:example) do
        platform = Platform.create(id: 1, name: 'facebook', base_url: 'https://www.facebook.com/')

        ("a".."z").to_a[0..9].each do |letter|
          Influencer.create(handle: letter, followers: rand(100), profile_pic_url: 'https://pbs.twimg.com/profile_images/1359778507224723457/QrykIUlp.jpg', platform_id: platform.id)
        end

        get :index

        @json = JSON.parse(response.body)
      end

      it "displays every influencer" do
        expect(@json.length).to eq(10)
      end
    end
  end
end
