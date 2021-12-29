require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe '#verify_article' do
    before(:all) do
      @article = FactoryBot.create(:article)
    end

    after(:all) do
      @article.destroy
    end

    it 'is valid with valid attributes' do
      expect(@article).to be_valid
    end

    # Was having trouble with this one - I tried (with 'shoulda-matchers' lib)
    # this way below here:
    #
    # it 'checks uniqueness of title' do
    #   expect(@article).to validate_uniqueness_of(:title)
    # end
    #
    # which gave me:
    # NoMethodError: undefined method `validate_uniqueness_of'
    #
    #
    # And I tried:
    # it 'checks uniqueness of title' do
    #    @article2 = FactoryBot.create(:article)
    #    expect(@article2.save!).to  raise_error(ActiveRecord::RecordInvalid,'Validation failed: Validation failed: Title has already been taken')
    # end
    #
    # Which gives me:
    #
    # Failure/Error: @article2 = FactoryBot.create(:article)
    #
    #  ActiveRecord::RecordInvalid:
    #        Validation failed: Title has already been taken
    #
    # Anyway else I can intercept this creation to check for validation of title?
    #
  end
end
