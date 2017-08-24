class DashboardsController < ApplicationController
    def show
        @alll_sales = Sale.all.collect(&:shoe)
        @all_sales = Sale.all
        @all_shoes = Shoe.all
    end
end
