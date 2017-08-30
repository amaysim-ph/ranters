class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'Ranter'
  belongs_to :followee, class_name: 'Ranter'
end
