# frozen_string_literal: true

class Product < ApplicationRecord
  enum type: { Book: 'Book', Electronic: 'Electronic' }
end
