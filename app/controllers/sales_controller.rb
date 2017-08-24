class SalesController < ApplicationController
    def create
        @shoe = Shoe.find(params[:id])

        Sale.create(user: current_user, shoe: @shoe)

        return redirect_to shoes_path
    end
end
