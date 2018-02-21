class DojosController < ApplicationController
    def index
        @dojos = Dojo.all
    end

    def new

    end

    def create
        @dojo = Dojo.create(:branch => params[:branch],:street => params[:street],:city => params[:city],:state => params[:state])
        if @dojo.valid?
            puts "I am in if"
            redirect_to "/dojos"
        else
            puts "I am in else"
            puts @dojo.errors
            flash[:error] = @dojo.errors
            redirect_to "/dojos/new"
        end
    end

    def show
        @dojo = Dojo.find(params[:id])
        @students = @dojo.students
    end

    def edit
        @dojo = Dojo.find(params[:id])
    end

    def update
        @dojo = Dojo.find(params[:id])
        @dojo.update(:branch => params[:branch],:street => params[:street],:city => params[:city],:state => params[:state])
        if @dojo.valid?
            redirect_to "/dojos"
        else
            flash[:error] = @dojo.errors
            redirect_to :back
        end
    end

    def destroy
        @dojo = Dojo.find(params[:id])
        @dojo.destroy
        redirect_to "/dojos"
    end
end
