# frozen_string_literal: true

class AddTotalToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :total, :integer
  end
end
