class LineItemsController < ApplicationController

    def create
        puts "Hit line_items#create"
        if !self.current_cart
            current_user.create_current_cart
            current_user.save
        end
        item = self.current_cart.add_item(params[:item_id])
        # current_cart.save
        item.save
        redirect_to cart_path(current_cart)
    end

end
