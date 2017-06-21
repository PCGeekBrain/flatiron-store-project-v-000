class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts

  belongs_to :current_cart, :class_name => "Cart"

  def create_new_current_cart
    self.create_current_cart
    self.current_cart.update(user: self)
    self.save
  end
end
