# frozen_string_literal: true
require 'pry'
class Checkout

    attr_accessor :basket, :price, :pricing_rules
  
    def initialize(pricing_rules)
        @basket = Hash.new(0)
        @price = 0.00
        @pricing_rules = pricing_rules
        validate
    end

    def scan(item)
        raise StandardError.new "Cet article n'existe pas" unless ["FR1", "AP1", "CF1"].include?(item)
        @basket[item] += 1
    end


    def total_price
        @basket.each do |item, value|
            if @pricing_rules.to_i == 0 # Si aucune promo
                no_rule(item, value)
            elsif @pricing_rules.to_i == 1 # Si la promo sur le fruit tea est en cours
                one_rule(item, value)
            elsif @pricing_rules.to_i == 2 # Si les 2 promos sont en cours
                two_rules(item, value)
            end
        end
    end

    private

    def validate
        raise StandardError.new "Ce n'est pas une promo en cours" unless [0, 1, 2].include?(pricing_rules.to_i)
    end

    def no_rule(item, value)
        @price += 3.11 * value if item == "FR1"
        @price += 5.00 * value if item == "AP1"
        @price += 11.23 * value if item == "CF1"
    end

    def one_rule(item, value)
        if item == "FR1" && value > 1
            @price += (3.11 * (value / 2)) + (3.11 * (value % 2))
        end
        @price = @price + 3.11 if item == "FR1" && value == 1
        @price += 5.00 * value if item == "AP1"
        @price += 11.23 * value if item == "CF1"
    end

    def two_rules(item, value)
        if item == "FR1" && value > 1
            @price += (3.11 * (value / 2)) + (3.11 * (value % 2))
        end
        @price += 3.11 if item == "FR1" && value == 1
        @price += 4.50 * value if item == "AP1" && value > 2
        @price += 4.50 * value if item == "AP1" && value <= 2
        @price += 11.23 * value if item == "CF1"
    end
  
  end