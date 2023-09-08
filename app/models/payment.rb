# frozen_string_literal: true

class Payment < ApplicationRecord
  has_many :payment_details
  belongs_to :customer
  serialize :info, JSON
  accepts_nested_attributes_for :payment_details

  def new
    @payment = Payment.new
    @payment.payment_details.build
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      puts 'Data imported successfully.'
    else
      puts "Error importing data: #{@payment.errors.full_messages.join(', ')}"
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :customer_id, :info,
                                    payment_details_attributes: [menu_type, menu_id, price])
  end
end
