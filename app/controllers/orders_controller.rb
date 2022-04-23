class OrdersController < ApplicationController
  def update
    if !request.body.read().blank?
      json_params = JSON.parse(request.body.read()).with_indifferent_access
      @invoice = Invoice.find(params[:id])

      if @invoice.update(:status => json_params[:status].upcase)
        render json: @invoice, status: :created
      else
        render status: :unprocessable_entity
      end
    else
      render status: :unprocessable_entity
    end
  end

  def create
    if !request.body.read().blank?
      json_params = JSON.parse(request.body.read()).with_indifferent_access
      email = json_params[:customer] =~ /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
      if email.nil?
        render json: {"error": "wrong email address"}, status: :bad_request
      end
      @invoice = Invoice.new(:customer => json_params[:customer])
      @invoice.save


      json_params[:menus].tally.each do |key, value|
        @menu = Menu.find_by_name(key)
        unless @menu.blank?
          Detail.create(:name => key, :total => value, :price => @menu.price * value, :invoice_id => @invoice.id)
        end
      end
      render json: @invoice, status: :created

    else
      render status: :unprocessable_entity
    end
  end

  def index
    @invoice = Invoice.where("DATE(created_at) = ?", Date.today)
    render json: @invoice, include: [:details], status: :ok
  end
end
