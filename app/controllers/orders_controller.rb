class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])

    # puts "ROHIT " 
    # puts @order.line_items.inspect

#     @order_details = @order.line_items.each do |item.product.price*(item[:quantity].to_i)|
#       # item.product
#      @total_order =  item++
# # { image:item.product.image,email:item.order.email,quantity:item.quantity, item_price_cents:item.item_price_cents,
# #   name:item.product.name, description:item.product.description, order:item.order.total_cents}
#   # puts item.product.image
#  end
# puts @total_order
# @total_order = Order.find()



  # @total_order = @order.line_items.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum

#   @total_order =@order.line_items.map do |item|    
# ((item.quantity).to_i*item.item_price_cents)
#   end
end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
