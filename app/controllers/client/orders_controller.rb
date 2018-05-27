class Client::OrdersController < ApplicationController

  def show
    order_id = params[:id]
    response = Unirest.get("http://localhost3000/api/orders/#{order_id}")
    @order = response.body
    render 'show.html.erb'

  end

  def new
    render 'new.html.erb'
  end

end
