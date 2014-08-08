class User < ActiveRecord::Base
  attr_accessor :not_validate_password
  has_many :learnings, dependent: :destroy
  has_many :user_answers,dependent: :destroy
  has_many :lessons, through: :learnings
  has_many :relationships, foreign_key: "follower_id" , dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                 class_name:  "Relationship",
                                 dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name , presence: true , length: { maximum: 50} )
  validates :email, presence: true, 
            format: { with: VALID_EMAIL_REGEX },
                uniqueness: {case_sensitive: false}
  validates :password , length:{minimum: 6}, unless: :not_validate_password
  before_save {self.email = email.downcase}
  before_create :create_remember_token
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
      Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
