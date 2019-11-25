require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  let(:user) { create :user }
  let(:blog_post_1) { create :blog_post, user: user, title: "Sample", description: "Sample App" }
  let(:blog_post_2) { create :blog_post, user: user, title: "Sample", description: "Sample App" }
  let(:blog_post_3) { create :blog_post, title: "Sample 1", description: "Sample App" }

  describe "BlogPost" do
    it "stores valid record" do
      blog_post_1
      expect(blog_post_1.user_id).to eq(user.id)
      expect(blog_post_1.title).to eq("Sample")
    end

    it "checks valid title" do
      blog_post_2
      expect { blog_post_1 }.to raise_exception(/Title has already been taken/)
    end

    it "checks user presence" do
      expect { blog_post_3 }.to raise_exception(/User must exist/)
    end
  end
end
