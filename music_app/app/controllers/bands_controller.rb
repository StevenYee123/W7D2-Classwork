class BandsController < ApplicationController 
    def index 
        @bands = Band.all

        render :index 
    end

    def new 
        @band = Band.new 
        render :new
    end

    def edit 
        @band = Band.find(params[:id])

        render :edit
    end

    def create 
        @band = Band.new(band_params)

        if @band.save
            #Fix this!
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def show

    end

    private 
    def band_params
        params.require(:band).permit(:name)
    end
end