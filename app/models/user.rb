class User < ApplicationRecord
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  belongs_to :department, optional: true
  has_many :book_tables, dependent: :destroy

  delegate :name, to: :department, prefix: :department

  enum gender: {man: 0, women: 1}

  VALID_EMAIL_REGEX = Settings.email_regex
  PERMIT_ATTRIBUTES = %i(name email password password_confirmation address
    birthday phone gender).freeze
  USER_PARAMS = %i(name email address phone birthday department_id gender
    password password_confirmation).freeze
  CUSTOMER_UPDATE_PARAMS = %i(name address phone birthday gender
    password password_confirmation).freeze

  attr_accessor :activation_token

  before_save :downcase_email

  validates :name, :email, :address, :phone,
            :birthday, presence: true
  validates :name, length: {maximum: Settings.user.name.max_length}
  validates :address, length: {maximum: Settings.user.address.max_length}
  validates :phone, numericality: true,
    length: {minimum: Settings.user.phone.min_length, maximum: Settings.user.phone.max_length}

  scope :filter_by_name, ->(user_name){where("name LIKE '%#{user_name}%'") if user_name.present?}
  scope :filter_by_email, ->(user_email){where "email LIKE '%#{user_email}%'" if user_email.present?}
  scope :filter_by_address, ->(user_address){where "address LIKE '%#{user_address}%'" if user_address.present?}

  private

  def downcase_email
    email.downcase!
  end
end
