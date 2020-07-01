# frozen_string_literal: false

# a waiter class
class Waiter
  attr_accessor :name, :age
  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    best_tip = 0
    best_tipper = nil
    Meal.all.each do |meal|
      if best_tip < meal.tip
        best_tip = meal.tip
        best_tipper = meal.customer
      end
    end
    best_tipper
  end
end
