# frozen_string_literal: true

class AddInfoToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :info, :text
  end
end
