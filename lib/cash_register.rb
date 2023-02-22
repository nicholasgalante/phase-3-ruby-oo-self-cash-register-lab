class CashRegister
  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(item, amount, quantity = 1)
    @last_transaction = [item, amount, quantity]
    self.total += amount * quantity
    quantity.times do
      self.items << item
    end
  end

  def apply_discount
    if self.discount != 0
      self.total = self.total * ((100 - self.discount.to_f) / 100)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= (self.last_transaction[1] * self.last_transaction[2])
    self.items.pop
    if self.items.length == 0
      self.total = 0.0
    end
  end
end
