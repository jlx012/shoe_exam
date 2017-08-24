class User < ActiveRecord::Base
  has_many :shoes, dependent: :destroy
  has_many :shoes, through: :sales, source: :shoe
  has_many :sales, dependent: :destroy

  has_secure_password

  before_save :downcase_fields

  validates :first_name, presence: true, length: 2..60
  validates_format_of :first_name, with: /\A[-a-z]+\Z/i
  validates :last_name, presence: true, length: 2..60
  validates_format_of :last_name, with: /\A[-a-z]+\Z/i
  validates :email, presence:true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def downcase_fields
      self.first_name.downcase!
      self.last_name.downcase!
      self.email.downcase!
  end
end
