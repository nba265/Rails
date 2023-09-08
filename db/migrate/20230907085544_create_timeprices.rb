# frozen_string_literal: true

class CreateTimeprices < ActiveRecord::Migration[7.0]
  def change
    create_table :timeprices do |t|
      t.string :name
      t.string :price

      t.timestamps
    end
  end
end
