class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    else
      @order_form = OrderForm.new
      render :index, status: :unprocessable_entity
    end
  end

  def new
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :post_code,
      :prefecture_id,
      :city,
      :address,
      :building,
      :phone_number
    ).merge(token: params[:token], item_id: @item.id, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
