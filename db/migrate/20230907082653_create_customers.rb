# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.string :gender, null: false, default: 'other'
      t.date :birthday, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.integer :level, default: 1

      t.timestamps
    end
  end
end
