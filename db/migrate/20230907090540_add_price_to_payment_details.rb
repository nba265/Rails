# frozen_string_literal: true

class AddPriceToPaymentDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :payment_details, :price, :integer
  end
end
