# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :payments

  validates :email, uniqueness: true, format: { with: /\A[\w.-]+@[a-z\d]+\.[a-z]+\z/, message: 'Invalid email' }
  validates :phone_number, format: { with: /\A\d{10}\z/, message: 'Invalid phone number' }
  #  validates :gender, inclusion: { in: ['male','female','other'] }
  #  validates :level, inclusion: {in: ['free', 'normal', 'medium'], allow_nil: true}

  enum gender: { male: 'male', female: 'female', other: 'other' }
  enum level: { free: 1, normal: 2, medium: 3 }

  def full_name
    "#{first_name} #{last_name}"
  end

  scope :not_free_level, -> { where.not(level: :free) }

  scope :search_by_name, ->(name) { where('concat(first_name, " ", last_name) LIKE :search', search: "%#{name}%") }

  scope :register_month, ->(_month) { where(registration_date: date.beginning_of_month...date.end_of_month) }
end
