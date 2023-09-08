# frozen_string_literal: true

class AddRegistrationDateToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :registration_date, :date
  end
end
