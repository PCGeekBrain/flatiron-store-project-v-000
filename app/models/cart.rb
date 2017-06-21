class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items

    belongs_to :user

    enum status: [:pending, :submitted]

    def total
        self.line_items.inject(0){|sum, line_item| sum + line_item.item.price * line_item.quantity}
    end

    def add_item(item_id)
        item_id = item_id.id if item_id.is_a?(Item)
        line_item = self.line_items.find_by(item_id: item_id)
        if line_item
            #We already have the item in the cart
            line_item.update(quantity: line_item.quantity + 1)
        else
            line_item = self.line_items.build(item_id: item_id)
        end
        return line_item
    end

    def checkout
        self.status = "submitted"
        subtract_inventory
    end
    
    private
    def subtract_inventory
        if self.submitted?
            self.line_items.each do |line_item|
                new_inventory = line_item.item.inventory - line_item.quantity
                line_item.item.update(inventory: new_inventory)
            end
        end
    end
end
