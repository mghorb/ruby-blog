# frozen_string_literal: true

module Approval
  extend ActiveSupport::Concern

  APPROVAL_STATUSES = ['submitted', 'approved', 'flagged']

  included do
    validates :status, inclusion: { in: APPROVAL_STATUSES }
  end

  def approved?
    status == 'approved'
  end
end

