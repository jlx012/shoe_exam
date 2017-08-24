class Shoe < ActiveRecord::Base
    belongs_to :user, required: true


    validates :name, presence: true, length: 2..30
    validates_format_of :name, with: /\A[a-zA-Z\d ]*$\z/
    validates :price, presence: true, length: 1..10
    validates_format_of :price, with: /\A\d+(?:\.\d{0,2})?\z/
end
