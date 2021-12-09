class Comment < ApplicationRecord
  include Approval
  belongs_to :article
end

