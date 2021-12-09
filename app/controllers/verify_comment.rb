class VerifyComment < ApplicationJob
  queue_as :default

  TRIGGER_WORDS = ['hate','bad','boo', ':(']

  def perform(comment)
    if TRIGGER_WORDS.any? { |s| comment.body.include? s}
      comment.update_attribute(:status, 'flagged')
    else
      comment.update_attribute(:status, 'approved')
    end
  end
end
