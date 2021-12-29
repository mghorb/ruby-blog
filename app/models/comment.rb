class Comment < ApplicationRecord
  include Approval
  belongs_to :article

  before_save :change_status

  after_create :verify_comment
  after_update :verify_comment

  def change_status
    self.status = 'submitted'
  end

  def verify_comment
    VerifyComment.perform_later(self)
  end

end

