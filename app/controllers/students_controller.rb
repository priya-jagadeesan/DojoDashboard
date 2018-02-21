class StudentsController < ApplicationController
    def index
        @dojo = Dojo.find(params[:id])
        @students = @dojo.students
    end

    def new
        @dojo_id = Dojo.find(params[:dojo_id])
        @dojos = Dojo.where.not(id: (Dojo.find(params[:dojo_id])))
    end

    def create
        @dojo = Dojo.find(params[:branch])
        @student = Student.create(:first_name => params[:first_name],:last_name => params[:last_name], :email => params[:email],:dojo => @dojo)
        if @student.valid?
            redirect_to "/dojos/"+@dojo.id.to_s
        else
            flash[:error] = @student.errors
            redirect_to "/dojos/"+@dojo.id.to_s+"/students/new"
        end
    end

    def show
        @dojo = Dojo.find(params[:dojo_id])
        @student = Student.find(params[:id])
    end

    def edit
        @dojo_id = Dojo.find(params[:dojo_id])
        @dojos = Dojo.where.not(id: (Dojo.find(params[:dojo_id])))
        @student = Student.find(params[:id])
    end

    def update
        @dojo = Dojo.find(params[:branch])
        @student = Student.find(params[:id])
        @student.update(:first_name => params[:first_name],:last_name => params[:last_name],:email => params[:email],:dojo => @dojo)
        if @student.valid?
            redirect_to "/dojos/"+@dojo.id.to_s
        else
            flash[:error] = @student.errors
            redirect_to "/dojos/"+@dojo.id.to_s+"/students/"+@student.id.to_s+"/edit"
        end
    end

    def destroy
        @dojo = Dojo.find(params[:dojo_id])
        @student = Student.find(params[:id])
        @student.destroy
        redirect_to "/dojos/"+@dojo.id.to_s
    end
end
