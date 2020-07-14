class User < ApplicationRecord
  belongs_to :department, optional: true
  has_many :book_table

  delegate :name, to: :department, prefix: :department

  enum role: {admin: 0, user: 1, customer: 2}, gender: {man: 0, women: 1}, activated: {unactive: 0, active: 1}

  VALID_EMAIL_REGEX = Settings.email_regex

  PERMIT_ATTRIBUTES = %i(name email password password_confirmation address
                          birthday phone gender).freeze

  CUSTOMER_UPDATE_PARAMS = %i(name address phone birthday
                              gender password password_confirmation).freeze
  USER_PARAMS = %i(name email address phone birthday role activated
                   department_id gender password password_confirmation).freeze

  attr_accessor :activation_token

  before_save :downcase_email
  before_create :create_activation_digest

  validates :name, :email, :address, :phone,
            :birthday, presence: true

  validates :name, length: {maximum: Settings.user.name.max_length}
  validates :email, length: {maximum: Settings.user.email.max_length},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: true
  validates :address,
            length: {maximum: Settings.user.address.max_length}
  validates :phone, numericality: true,
            length: {minimum: Settings.user.phone.min_length,
                     maximum: Settings.user.phone.max_length}
  validates :password, length: {minimum: Settings.user.password.min_length},
            allow_nil: true

  has_secure_password

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def activate
    update activated: true
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private

  def downcase_email
    email.downcase!
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
