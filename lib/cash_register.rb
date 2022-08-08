class CashRegister
    attr_accessor :total, :discount, :all_items, :last_price
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @all_items = []
        @last_itm_price = 0
    end
    def add_item(title, price, quantity = 1)
        self.last_price = price * quantity
        self.total += last_price

        quantity.times do
            self.all_items << title
        end
       
    end
    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else 
        self.total -= (discount.to_f / 100) * self.total 
        "After the discount, the total comes to $#{self.total.to_i}."
        end
    end
    def items
        self.all_items
    end
    def void_last_transaction
        self.all_items.pop
        self.total -= last_price
    end
end
