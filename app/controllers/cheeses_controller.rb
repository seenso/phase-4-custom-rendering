class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses

    # ^ we can choose what we want to send by doing below:
    #   render json: {
      #     id: cheese.id,
      #     name: cheese.name,
      #     price: cheese.price,
      #     is_best_seller: cheese.is_best_seller
      #   }
      
      # OR we can shorthand it with the below
      # render json: cheeses, only: [:id, :name, :price, :is_best_seller]
      
      # OR we can say send all EXCEPT...
      # render json: cheeses, except: [:created_at, :updated_at]
      
      # to include METHODS, like .summary (in the cheese model), add "methods: []"
      render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
      
    end

    # GET /cheeses/:id
    def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese
    else
      # status: :not_found will produce a 404 status code
      render json: { error: "Cheese not found" }, status: :not_found
    end
  end

end
