# frozen_string_literal: true

require_relative '../lib/checkout'
require 'pry'

def perform
  p "Quel promo utiliser ? ( 0) aucune, 1) promo sur le Fruit Tea, 2) promo 1 + promo sur les pommes)"
  pricing_rules = gets.chomp
  co = Checkout.new(pricing_rules)
  stop = "y"
  while stop == "y"
    p "Quel article voulez-vous scanner ? FR1, AP1, CF1"
    art = gets.chomp
    co.scan(art)
    p "Voulez-vous continuer ? y/n"
    stop = gets.chomp
  end
  co.total_price
  p co.price.round(2)
end

perform