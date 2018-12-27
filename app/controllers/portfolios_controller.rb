class PortfoliosController < ApplicationController
    layout "portfolio"
    access all: [:show, :index, :angular], user: {except: [:new, :edit, :update, :destroy, :sort]}, admin: :all
    def index
        @portfolio_items = Portfolio.by_position
    end
    def sort
        params[:order].each do | key, value|
            Portfolio.find(value[:id]).update(position: value[:position])
        end
        render nothing: true
    end
    def angular
        @angular_portfolio_items = Portfolio.angular
    end

    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end
    def create
        @portfolio = Portfolio.new(portfolio_params)
        respond_to do |format|
        if @portfolio.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
        else
            format.html { render :new }
        end
        end
    end

    def edit
        @portfolio_item = Portfolio.find(params[:id])
    end

    def update
        @portfolio_item = Portfolio.find(params[:id])

        respond_to do |format|
            if @portfolio_item.update(portfolio_params)
              format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
            else
              format.html { render :edit }
            end
          end
    end

    def show
        @portfolio_item = Portfolio.find(params[:id])
    end

    def destroy
        @portfolio_item = Portfolio.find(params[:id])
        @portfolio_item.destroy
        respond_to do |format|
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed.' }
        end
    end

    private
    def portfolio_params
        params.require(:portfolio).permit(:title, :subtitle, :body,:thumb_image, :main_image, technologies_attributes: [:id,:name, :_destroy])
    end
end
