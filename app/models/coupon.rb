# frozen_string_literal: true

class Coupon < ApplicationRecord
  has_many :payment_details, as: :menu
end
