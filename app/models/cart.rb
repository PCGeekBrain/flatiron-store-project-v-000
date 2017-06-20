class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items

    belongs_to :user

    enum status: [:pending, :submitted]

    def total
        self.line_items.inject(0){|sum, line_item| sum + line_item.item.price * line_item.quantity}
    end
end
