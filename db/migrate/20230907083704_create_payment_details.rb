# frozen_string_literal: true

class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.string :menu_type
      t.integer :menu_id
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
