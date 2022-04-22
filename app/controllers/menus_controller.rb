class MenusController < ApplicationController
  def index
    @menus = Menu.all
    render json: @menus, include: [:category], status: :ok
  end

  def create
    json_params = JSON.parse(request.body.read()).with_indifferent_access
    @menu = Menu.add_menu(json_params[:name], json_params[:description], json_params[:price], json_params[:category])
    if @menu.created_at.nil?
      render json: {
        "error" => "cant created",
      }, status: :bad_request
    else
      render json: @menu, status: :created
    end
  end

  def destroy
    @menu = Menu.where(id: params[:id]).first
    if @menu.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def update
    json_params = JSON.parse(request.body.read()).with_indifferent_access
    @menu = Menu.find(params[:id])

    if @menu.update(:name => json_params[:name], :description => json_params[:description], :price => json_params[:price])
      render json: @menu, status: :created
    else
      render status: :unprocessable_entity
    end
  end
end
