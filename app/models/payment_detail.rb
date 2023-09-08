# frozen_string_literal: true

class PaymentDetail < ApplicationRecord
  belongs_to :menu, polymorphic: true
  belongs_to :payment
end
