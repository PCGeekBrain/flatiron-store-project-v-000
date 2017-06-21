class CartsController < ApplicationController

    before_filter :authenticate_user!
    
    def index
    end
    
    def show
    end

    def new
    end
    
    def edit
    end

    def create
    end
    
    def update
    end
    
    def destroy
    end
    
    def checkout
        get_cart
        @cart.checkout
        current_user.current_cart = nil
        if @cart.save && @current_user.save
            redirect_to cart_path(@cart), notice: 'Thanks for your order!'
        end
    end

    private
    def get_cart
        @cart = current_cart
        redirect_to store_path if @cart.nil?
    end

end
