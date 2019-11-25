require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create :user }
  let(:blog_post) { create :blog_post, title: "Sample App", description: "Sample test content", user: user }
  let(:comment_1) { create :comment, user: user, blog_post: blog_post, message: "Sample App" }
  let(:comment_2) { create :comment, user: user, blog_post: blog_post }
  let(:comment_3) { create :comment, blog_post: blog_post, message: "Sample Content"}
  let(:comment_4) { create :comment, user: user, message: "Sample Content" }

  describe "tests for comment model" do
    it 'create comment with count 1' do
      comment_1
      expect(Comment.count).to eq(1)
      expect(comment_1.user_id).to eq(user.id)
    end

    it 'validates presence of message' do
      expect { comment_2 }.to raise_exception(/Message can't be blank/)
    end

    it 'validates user existence' do
      expect { comment_3 }.to raise_exception(/User must exist/)
    end

    it 'validates blog_post existence' do
      expect { comment_4 }.to raise_exception(/Blog post must exist/)
    end
  end
end
