class Dashboard < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :shoe, required: true
end
