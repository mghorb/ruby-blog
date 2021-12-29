require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe '#verify_comment' do
    before(:all) do
      @article = FactoryBot.create(:article)
    end

    after(:all) do
      @article.destroy
    end

    it 'is valid with valid attributes' do
      @comment = @article.comments.create(commenter: 'Joe', body: 'blahblahblah', status: 'submitted')
      expect(@comment).to be_valid
    end

    it 'flags comment when trigger word is found' do
      @comment = @article.comments.create(commenter: 'Jill', body: 'bad comment', status: 'submitted')
      VerifyComment.new.perform(@comment)

      expect(@comment.status).to match('flagged')
    end
  end
end
