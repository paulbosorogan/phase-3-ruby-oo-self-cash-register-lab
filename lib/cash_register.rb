require 'pry'
class CashRegister
    attr_accessor :total, :discount, :quantity, :items, :previous_price

    def initialize (discount= 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        # self.items << title * quantity
        @previous_price = price * quantity
        quantity.times do 
            self.items << title
        end
    end
    
    def apply_discount
    if discount == 0
        "There is no discount to apply."
    else self.total = self.total - (self.total * discount / 100)
        "After the discount, the total comes to $#{self.total}."
    end
    end

    def items
        @items
    end

    def void_last_transaction
        binding.pry
        if self.items.empty?
        self.total = 0
        else self.total = self.total - self.previous_price
        end
    end
end
