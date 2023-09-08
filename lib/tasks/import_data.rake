# frozen_string_literal: true

require 'date'

namespace :import do
  task data_customer: :environment do
    arr = ('A'..'Z').to_a
    address = %w[Hue Danang Hanoi Saigon]
    start_date = Date.new(1950, 1, 1)
    end_date = Date.new(2015, 12, 31)
    start_date1 = Date.new(2019, 1, 1)
    end_date1 = Date.new(2023, 1, 1)
    (100..150).each do |i|
      birthday = start_date + rand(end_date - start_date + 1)
      registration_date = start_date1 + rand(end_date1 - start_date1 + 1)
      customer = Customer.new(
        first_name: 'Le',
        last_name: "Thi #{arr.sample}",
        phone_number: "0#{rand(100_000_000..999_999_999)}",
        gender: %i[male female other].sample,
        birthday:,
        email: "email#{i}@gmail.com",
        address: address.sample,
        level: rand(1..3),
        registration_date:
      )

      if customer.save
        puts 'Data imported successfully.'
      else
        puts "Error importing data: #{customer.errors.full_messages.join(', ')}"
      end
    end
  end

  task data_payment: :environment do
    (1..10).each do |i|
      payment = Payment.new(name: "Payment #{i}", customer_id: i)
      if payment.save
        puts 'Data imported successfully.'
      else
        puts "Error importing data: #{payment.errors.full_messages.join(', ')}"
      end
    end
  end

  task data_timeprice: :environment do
    (1..10).each do |i|
      timeprice = Timeprice.new(name: "Timeprice #{i}", price: i * 13)
      if timeprice.save
        puts 'Data imported successfully.'
      else
        puts "Error importing data: #{timeprice.errors.full_messages.join(', ')}"
      end
    end
  end

  task data_coupon: :environment do
    (1..10).each do |i|
      coupon = Coupon.new(name: "Coupon #{i}", price: i * 9)
      if coupon.save
        puts 'Data imported successfully.'
      else
        puts "Error importing data: #{timeprice.errors.full_messages.join(', ')}"
      end
    end
  end
end
