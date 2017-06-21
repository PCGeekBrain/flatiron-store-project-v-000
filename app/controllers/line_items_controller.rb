class LineItemsController < ApplicationController

    def create
        if !self.current_cart
            current_user.create_new_current_cart
        end
        item = self.current_cart.add_item(params[:item_id])
        # current_cart.save
        item.save
        redirect_to cart_path(current_cart)
    end

end
