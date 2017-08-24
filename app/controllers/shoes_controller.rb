class ShoesController < ApplicationController
    def index
        @all_shoes = Shoe.all
        @all_sales = Sale.all.collect(&:shoe)

    end

    def create
      @shoe = Shoe.new(idea_params)
      @user = current_user

      if @shoe.save
          flash[:notice] = ["Thanks for putting up a sale!"]

          return redirect_to dashboard_path(@user)
      end

      errors = @shoe.errors.full_messages

      flash[:errors] = errors

      return redirect_to :back
    end

    def destroy
        @shoe = Shoe.find(params[:id])
        @user = current_user

        @shoe.delete

        return redirect_to dashboard_path(@user)
    end

    private
        def idea_params
            params.require(:shoe).permit(:name, :price).merge(user: current_user)
        end
end
