# frozen_string_literal: true

class Timeprice < ApplicationRecord
  has_many :payment_details, as: :menu
end
